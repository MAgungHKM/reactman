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
FROM trafex/php-nginx:2.5.0 AS runner

ARG APP_TZ
ARG APP_PORT

WORKDIR /web

COPY --from=composer /composer /web
COPY --from=composer /composer/webman.nginx.conf /etc/nginx/conf.d/default.conf.template 
COPY --from=composer /composer/webman.supervisord.conf /etc/supervisor/conf.d/supervisord.conf

USER root
RUN apk update &&\
  # Packages
  apk add -U --no-cache \
  php8-posix \
  php8-pcntl \
  tzdata \
  openrc \
  lsof \
  gettext \
  && \
  # clear cache
  rm -rf /var/cache/apk/* 

ENV TZ=${APP_TZ:-"UTC"}
RUN ln -fs "/usr/share/zoneinfo/${TZ}" /etc/localtime && \
  echo "${TZ}" >  /etc/timezone

ENV APP_PORT=${APP_PORT:-"8787"}
RUN envsubst '\$APP_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

RUN chown -R nobody:nobody /web
RUN chmod -R 755 /web
USER nobody

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]