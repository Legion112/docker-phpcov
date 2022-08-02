FROM fearofcode/phive:0.15.1 as build

ARG VERSION

RUN echo 'y' | phive install phpcov@$VERSION --global --copy

FROM php:7.4-cli-alpine

ENV XDEBUG_MODE=coverage

RUN apk --no-cache add ${PHPIZE_DEPS} \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug \
  && apk del ${PHPIZE_DEPS}

COPY bin/entrypoint /usr/bin
COPY --from=build /usr/local/bin/phpcov /usr/local/bin/phpcov

ENTRYPOINT ["/usr/bin/entrypoint"]