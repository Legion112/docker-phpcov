# docker-phpcov
Dockerfile for https://github.com/sebastianbergmann/phpcov

# To build 
[Using github](https://github.com/Legion112/docker-phpcov/actions/workflows/image.yml)

use `version=6.0.1` for phpunit 8
use `version=8.0.0` for phpunit 9
## Build example 
```shell
version=6.0.1 make image.build
```

# Usage
```shell
docker run --rm -w /app/bpg/ -v $(pwd):/app/bpg/ fearofcode/phpcov:6.0.1  merge --xml .phpunit.coverage.xml  .phpunit.coverage.php/
```

# Troubleshooting
You must use same mount structure as it was while running phpunit. It releases on [absolute path of file](https://github.com/sebastianbergmann/phpunit/issues/5027).