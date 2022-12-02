ARG TAG="8.1-cli-alpine"
FROM php:$TAG

ENV XDEBUG_MODE=coverage

RUN --mount=type=bind,from=fearofcode/phive:0.15.1,source=/usr/local/bin/phive,target=/usr/local/bin/phive \
    --mount=type=bind,from=mlocati/php-extension-installer:1.5,source=/usr/bin/install-php-extensions,target=/usr/local/bin/install-php-extensions \
      install-php-extensions xdebug && echo 'y' | phive install phpcov@$VERSION --global --copy

COPY bin/entrypoint /usr/bin
COPY --from=build /usr/local/bin/phpcov /usr/local/bin/phpcov

ENTRYPOINT ["/usr/bin/entrypoint"]