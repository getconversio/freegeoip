#!/bin/bash

curl ${MAXMIND_DB} -o ~/GeoLite2-City.mmdb.tar.gz

tar xvfz ~/GeoLite2-City.mmdb.tar.gz

mv ~/GeoLite2-City_*/GeoLite2-City.mmdb .

gzip ~/GeoLite2-City.mmdb

freegeoip -http :${PORT} -use-x-forwarded-for -public /app/cmd/freegeoip/public -quota-backend map -quota-max 0 -db ~/GeoLite2-City.mmdb.gz
