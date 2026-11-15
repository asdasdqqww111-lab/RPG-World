# توثيق الأصول

## حالة خامة الأرض

لم تُدمج خامة صورة خارجية في المشروع بعد. الخامة الموجودة في `scenes/world/flat_terrain.tscn` تظل مادة Godot بسيطة مولدة من إعدادات المادة، وليست صورة واقعية أو خامة PBR.

### مرشح تم التحقق من مصدره وترخيصه، لكنه غير مضمّن

- **الاسم:** Ground 037 (ambientCG)
- **صفحة الأصل:** https://ambientcg.com/view?id=Ground037
- **المصدر المضيف للملف على GitHub:** https://github.com/wheresjames/dvision/blob/master/assets/textures/Ground037/Ground037_1K-JPG_Color.jpg
- **بيانات مصدر الملف المحدد:** https://github.com/wheresjames/dvision/blob/master/assets/textures/Ground037/SOURCE.md
- **المؤلف/المصدر:** ambientCG؛ يذكر توثيق المستودع المصدر Lennart Demes.
- **الترخيص:** CC0 1.0 Universal وفق ملف `SOURCE.md` الخاص بهذا الملف وصفحة ambientCG للترخيص: https://docs.ambientcg.com/license/ . صفحة الأصل: https://ambientcg.com/view?id=Ground037
- **الملفات المستخدمة في المشروع:** لا شيء؛ لم يتم نسخ أي ملف خامة إلى هذا المشروع.
- **الملف الذي تم التحقق من وجوده في المصدر:** `Ground037_1K-JPG_Color.jpg` (ملف لون/Albedo، حجمه 2,187,764 بايت في مستودع المصدر). يذكر ملف المصدر أنه مستخرج من `Ground037_1K-JPG.zip`، وأن أبعاد المادة التقريبية 2.1×2.1 متر.
- **خرائط PBR الأخرى:** لم يتم التحقق من وجود خرائط Normal أو Roughness في مستودع GitHub المذكور؛ الملف المتاح في مساره هو خريطة اللون فقط. لذلك لا نصف المرشح بأنه حزمة PBR مكتملة.

لم تُضف الخامة لأن بيئة تحرير المستودع المتاحة لهذه المهمة تتيح حفظ ملفات نصية فقط ولا تتيح جلب/إرفاق محتوى ملف JPEG ثنائي. لم يتم وضع ملف وهمي أو تغيير المشهد على أساسه. بعد تنزيل ملف اللون من المصدر والتحقق منه محليًا، يمكن إضافته إلى `assets/textures/ground/`، وضبط خامة الأرض بتكرار UV بحيث تكون كل دورة قرابة 2.1 متر بدل تمديدها على مساحة 1000 متر. يُفضّل عندها استكمال خرائط Normal وRoughness من مصدر موثق بشكل مستقل قبل وصف المادة بأنها PBR.

### المرشح السابق

تم فحص [fabien-michel/sweethome3d-textures-ambientcg](https://github.com/fabien-michel/sweethome3d-textures-ambientcg) وملف [LICENSE](https://github.com/fabien-michel/sweethome3d-textures-ambientcg/blob/main/LICENSE) الذي يعلن CC0 1.0، كما يذكر README أن المحتوى مشتق من ambientCG. لكنه مشروع مولّد/مكتبة كبيرة، ولم يثبت ملفًا محددًا وخرائطه في هذه المهمة؛ لذلك لم تُنسخ منه أصول.
