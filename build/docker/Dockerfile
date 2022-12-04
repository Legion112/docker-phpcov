ARG VERSION=8
ARG PHP_TAG="8.1-cli-alpine"
FROM fearofcode/phive:${PHP_TAG}-0.15.2
RUN phive install phpcov@$VERSION --global --copy

FROM php:$TAG

ENV XDEBUG_MODE=coverage

RUN --mount=type=bind,from=fearofcode/phive:8.1-cli-alpine-0.15.2,source=/usr/local/bin/phive,target=/usr/local/bin/phive \
    --mount=type=bind,from=mlocati/php-extension-installer:1.5,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
      install-php-extensions xdebug gpg && echo 'y' | phive install phpcov@$VERSION --global --copy

COPY bin/entrypoint /usr/bin

ENTRYPOINT ["/usr/bin/entrypoint"]