```console
$ cd downloads
```

`dbip-city-lite`

```console
$ curl -O https://download.db-ip.com/free/dbip-city-lite-2022-10.mmdb.gz
$ gunzip dbip-city-lite-2022-10.mmdb.gz
```

`geolite2-city`

```console
$ export MAXMIND_LICENSE_KEY=LNpsJCCKPis6XvBP # this key is not valid anymore
$ curl -L "https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=${MAXMIND_LICENSE_KEY}&suffix=tar.gz" -o geolite2-city.mmdb.gz
$ gunzip geolite2-city.mmdb.gz
```
