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

# تحميل النسخة المستقرة من منتدى NodeBB
RUN git clone -b v3.x https://github.com/NodeBB/NodeBB.git .

# تثبيت الحزم والاعتماديات الخاصة بالمنتدى
RUN npm install --production

# فتح المنفذ الافتراضي للمنتدى
EXPOSE 4567

# أمر التشغيل الافتراضي لتشغيل المنتدى
CMD ["node", "app.js"]
