# استخدام نسخة Node.js الرسمية والمستقرة
FROM node:18-slim

# إنشاء مجلد العمل داخل الحاوية
WORKDIR /usr/src/app

# تثبيت الأدوات الأساسية اللازمة لبناء إضافات NodeBB
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    git \
    && rm -rf /var/lib/apt/lists/*

# تحميل النسخة المستقرة من منتدى NodeBB مباشرة في المجلد الحالي
RUN git clone -b v3.x https://github.com/NodeBB/NodeBB.git .

# تغيير مسار العمل والتأكد من الانتقال للمجلد الصحيح إذا لزم الأمر
WORKDIR /usr/src/app

# تثبيت الحزم والاعتماديات الخاصة بالمنتدى بشكل صحيح
RUN npm install --omit=dev

# فتح المنفذ الافتراضي للمنتدى
EXPOSE 4567

# أمر التشغيل الافتراضي لتشغيل المنتدى
CMD ["node", "app.js"]
