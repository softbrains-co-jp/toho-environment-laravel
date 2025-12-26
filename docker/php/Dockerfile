FROM php:8.3-apache
EXPOSE 5173

WORKDIR /var/www

# 必要なPHP拡張とツール
# RUN apt-get update && apt-get install -y \
#     unzip \
#     git \
#     curl \
#     libicu-dev \
#     libzip-dev \
#     zip \
#     libonig-dev \
#     libpq-dev \
#     && docker-php-ext-install intl pdo pdo_mysql pdo_pgsql mbstring zip

# RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev \
#     && docker-php-ext-configure gd --with-freetype --with-jpeg \
#     && docker-php-ext-install gd    

# 必要なPHP拡張とツール
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl \
    libicu-dev \
    libzip-dev \
    zip \
    libonig-dev \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install intl pdo pdo_mysql pdo_pgsql mbstring zip gd bcmath

# Apache mod_ssl を有効にする
RUN a2enmod ssl

# Apache mod_rewrite を有効にする
RUN a2enmod rewrite

# conf.dを読み込むようにapache2.confに追記（重要）
RUN echo "IncludeOptional /etc/apache2/conf.d/*.conf" >> /etc/apache2/apache2.conf

# Composerインストール
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Node.js 20 をインストール
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest