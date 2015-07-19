# Simple json mock server nginx with perl module

### Running

```bash
docker run -d -p 80:80 cnam/mock-server
```

### Usage

Write new mock

```bash
curl 127.0.0.1/write -XPOST -d '{"json":"test-mock"}'
```

Read mock from application


Request

```bash
curl 127.0.0.1/read
```

Response

```json
{
    "json": "test-mock"
}
```

