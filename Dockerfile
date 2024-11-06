# Usa uma imagem base com PHP e Apache
FROM php:8.2-apache

# Instala extensões PHP necessárias para o Joomla
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libzip-dev unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql zip opcache

# Ativa o mod_rewrite para URLs amigáveis
RUN a2enmod rewrite

# Defina o diretório de trabalho
WORKDIR /var/www/html

# Copia o projeto Joomla para o contêiner
COPY . /var/www/html

# Define permissões para o Joomla
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Adiciona configurações para permitir acesso aos arquivos
RUN echo "<Directory /var/www/html>\n\
Options Indexes FollowSymLinks\n\
AllowOverride All\n\
Require all granted\n\
</Directory>" > /etc/apache2/conf-available/joomla.conf \
&& a2enconf joomla

# Define o ServerName para evitar mensagens de aviso no Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Expõe a porta do Apache
EXPOSE 80