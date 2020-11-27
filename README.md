# xmrig
Xmrig binary running in an Alpine Docker container for maximum performance

## Usage
```
docker run \
  --restart=unless-stopped \
  -v /path/to/config.json:/config/config.json
  --name=xmrig \
  -td skovati/xmrig:latest
```
