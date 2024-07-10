# aniftyco/Laravel

> Lightweight Alpine Linux container with Caddy, PHP & Node for Laravel

## Usage:

```dockerfile

FROM aniftyco/laravel

WORKDIR /app

COPY . .

RUN composer install --prefer-dist --no-progress --no-interaction --no-dev

RUN npm ci && npm run build
```

### Build it

```sh
docker build -t my-app .
```

### Run it

```sh
docker run --rm -it my-app
```
