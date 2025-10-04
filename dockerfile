FROM php:8.2-apache

# فعال کردن extensionهای مورد نیاز
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    pkg-config \
    libssl-dev \
    && docker-php-ext-install curl

# کپی کردن فایل‌ها
COPY . /var/www/html/

# تنظیم permissions
RUN chmod -R 755 /var/www/html/

# اکسپوز کردن پورت
EXPOSE 80

# استارت سرویس
CMD ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]