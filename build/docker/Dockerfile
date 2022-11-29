FROM fearofcode/phive:0.15.1 as build

ARG VERSION

RUN echo 'y' | phive install phpcov@$VERSION --global --copy

FROM php:7.4-cli-alpine

ENV XDEBUG_MODE=coverage

RUN  --mount=type=bind,from=mlocati/php-extension-installer:1.5,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
      install-php-extensions xdebug

COPY bin/entrypoint /usr/bin
COPY --from=build /usr/local/bin/phpcov /usr/local/bin/phpcov

ENTRYPOINT ["/usr/bin/entrypoint"]