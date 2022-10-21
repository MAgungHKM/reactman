FROM node:lts-alpine AS node

WORKDIR /node

COPY ./ ./

RUN npm config set fetch-retry-mintimeout 20000
RUN npm config set fetch-retry-maxtimeout 120000
RUN npm cache verify
RUN npm install -g npm@latest
# RUN npm install -g pnpm

RUN npm clean-install
RUN npm run build

FROM composer:2.2 AS composer

WORKDIR /composer

# copying the source directory and install the dependencies with composer
COPY ./ ./

COPY --from=node /node/app/view/www ./app/view/www

# run composer install to install the dependencies
RUN composer install \
  --optimize-autoloader \
  --no-interaction \
  --no-progress

RUN rm -rf views && \
  rm -rf node_modules

# continue stage build with the desired image and copy the source including the
# dependencies downloaded by composer
FROM jorge07/alpine-php:8.0 AS runner

WORKDIR /app

COPY --from=composer /composer /app

RUN apk update &&\
  apk add --no-cache php8-posix

# CMD [ "php", "start.php", "start", "-d" ]
# CMD [ "php", "start.php", "start" ]s
