# xmrig
Xmrig binary running in an Alpine Docker container for maximum performance

## Usage
grab a config [here](https://xmrig.com/wizard) and then
```
docker run \
  --restart=unless-stopped \
  -v /path/to/config.json:/mine/config.json \
  -e XMRIG_VERSION="6.6.1" \
  --name=xmrig \
  -td skovati/xmrig:latest
```
