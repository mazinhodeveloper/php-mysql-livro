# Use the stable PHP 8.5 image (released Nov 2025)
FROM php:8.5-apache

# Arguments defined in docker-compose.yml
ARG user
ARG uid

# 1. Install system dependencies (Must be root)
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Install PHP extensions (Must be root)
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# 3. Enable Apache mod_rewrite (MUST be root and before switching USER)
RUN a2enmod rewrite

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 4. Create system user and set permissions
RUN useradd -G www-data,root -u $uid -d /home/$user -m $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user 

# Set working directory
WORKDIR /var/www/html

# 5. Handle Permissions for the application folder
# Ensure your user owns the web root so it can write files
RUN chown -R $user:www-data /var/www/html

# OPTIONAL: Switch to non-root user
# Note: If you keep this, Apache may fail to start on port 80.
# For local development, many developers remove this and run as root,
# using the user 'livro' only for terminal commands (docker exec -u livro ...).
USER $user

EXPOSE 80
