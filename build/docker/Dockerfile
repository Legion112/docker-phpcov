ARG VERSION=8
ARG PHP_TAG="8.1-cli-alpine"
FROM fearofcode/phive:${PHP_TAG}-0.15.2 as tool
RUN echo 'y' | phive install phpcov@$VERSION --global --copy

FROM php:$PHP_TAG

ENV XDEBUG_MODE=coverage
RUN --mount=type=bind,from=mlocati/php-extension-installer:1.5,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
      install-php-extensions xdebug;
COPY bin/entrypoint /usr/bin

COPY --from=tool /usr/local/bin/phpcov /usr/local/bin/phpcov
ENTRYPOINT ["/usr/bin/entrypoint"]