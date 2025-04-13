docker stop jetty-https-test
docker rm jetty-https-test
docker run -d --rm \
    --name jetty-https-test \
    -p 8443:8443 \
    -v $(pwd)/ssl/keystore.jks:/etc/ssl/keystore.jks \
    -v $(pwd)/ssl/jetty-https.xml:/var/lib/jetty/etc/jetty-https.xml \
    -v $(pwd)/webapps:/var/lib/jetty/webapps/root \
    jetty:11-jdk11 \
    java -jar /usr/local/jetty/start.jar etc/jetty-https.xml
docker logs -f jetty-https-test