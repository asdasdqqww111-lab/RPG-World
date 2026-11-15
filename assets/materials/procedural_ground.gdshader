shader_type spatial;
render_mode diffuse_burley, specular_schlick_ggx;

// Lightweight, deterministic, world-space ground color. One Godot unit = one meter.
// Two value-noise scales avoid stretching across the 1000 m plane and require no image textures.
uniform vec4 grass_color : source_color = vec4(0.16, 0.29, 0.10, 1.0);
uniform vec4 soil_color : source_color = vec4(0.30, 0.22, 0.13, 1.0);
uniform float roughness : hint_range(0.0, 1.0) = 0.94;
uniform float broad_scale : hint_range(0.001, 1.0) = 0.035;
uniform float detail_scale : hint_range(0.01, 4.0) = 0.75;
uniform float color_variation : hint_range(0.0, 0.5) = 0.16;
uniform float soil_amount : hint_range(0.0, 1.0) = 0.34;

varying vec3 world_position;

float hash_2d(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float value_noise(vec2 p) {
    vec2 cell = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);

    float a = hash_2d(cell);
    float b = hash_2d(cell + vec2(1.0, 0.0));
    float c = hash_2d(cell + vec2(0.0, 1.0));
    float d = hash_2d(cell + vec2(1.0, 1.0));
    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

void vertex() {
    world_position = (MODEL_MATRIX * vec4(VERTEX, 1.0)).xyz;
}

void fragment() {
    vec2 ground_xz = world_position.xz;
    float broad_noise = value_noise(ground_xz * broad_scale);
    float detail_noise = value_noise(ground_xz * detail_scale);

    // Broad grass/soil patches with fine-scale breakup to soften their boundaries.
    float patch_signal = broad_noise * 0.78 + detail_noise * 0.22;
    float grass_mask = smoothstep(soil_amount, soil_amount + 0.28, patch_signal);
    vec3 ground_color = mix(soil_color.rgb, grass_color.rgb, grass_mask);
    float tonal_shift = 1.0 + (detail_noise - 0.5) * color_variation;

    ALBEDO = ground_color * tonal_shift;
    ROUGHNESS = roughness;
}
