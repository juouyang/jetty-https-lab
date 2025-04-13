curl -v \
    --resolve jetty.dev.net:8443:127.0.0.1 \
    --cacert ssl/server.crt \
    https://jetty.dev.net:8443
