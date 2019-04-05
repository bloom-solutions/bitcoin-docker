## Bitcoin on Docker

### The simplest and cleanest Docker image for running bitcoin

Build and run:
```
docker-compose build
docker-compose up -d
```

Defaults to testnet.

Edit docker-compose.yml for mainnet

Pull requests welcome!

// test rpc
curl --user user:password --data-binary '{"jsonrpc": "1.0", "id":"curltest", "method": "getblockcount", "params": [] }' -H 'content-type: text/plain;' http://127.0.0.1:18332/
