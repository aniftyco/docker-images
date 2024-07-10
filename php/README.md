# aniftyco/php

> Lightweight Alpine Linux container with Caddy & PHP

## Usage:

```dockerfile

FROM aniftyco/php

COPY index.php /app/
```

### Build it

```sh
docker build -t my-app .
```

### Run it

```sh
docker run --rm -it my-app
```
