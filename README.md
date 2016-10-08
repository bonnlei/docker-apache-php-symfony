# docker-apache-php-symfony

## Build
```bash
docker build --force-rm -t bonnlei/docker-php .
```

## Usage
```bash
docker run --name apache-php -it --link=dev-mysql:mysql -v $(pwd):/app -p 8080:80 bonnlei/docker-php
```


## Debug your PHP in Docker with Intellij/PHPStorm and Xdebug

* Config xdebug.ini
```
xdebug.remote_host = 10.254.254.254
xdebug.remote_connect_back = 0
```

* References
  https://gist.github.com/chadrien/c90927ec2d160ffea9c4