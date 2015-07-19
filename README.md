# Simple json mock server nginx with perl module

### Running

```bash
docker run -d -p 80:80 cnam/mock-server
```

### Usage

Write new mock

```bash
curl 127.0.0.1/write -XPOST -d '{"request":{"uri":"test"}, "response": {"body": {"json":"test-data"}}}'
```

Read mock from application


Request

```bash
curl 127.0.0.1/test
```

Response

```json
{
    "json": "test-data"
}
```

