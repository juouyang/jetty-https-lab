#!/bin/bash

CERT=ssl/server.crt
KEY=ssl/server.key
P12=ssl/keystore.p12
JKS=ssl/keystore.jks
ALIAS=nexus
P12PASS=53916262
STOREPASS=password
KEYPASS=password

echo "[1/3] ➜ Exporting to PKCS#12 (.p12)"
rm -f $P12
openssl pkcs12 -export \
  -in $CERT \
  -inkey $KEY \
  -out $P12 \
  -name $ALIAS \
  -passout pass:$P12PASS

echo "[2/3] ➜ Converting .p12 to .jks"
rm -f $JKS
keytool -importkeystore \
  -srckeystore $P12 -srcstoretype PKCS12 -srcstorepass $P12PASS \
  -destkeystore $JKS -deststoretype JKS \
  -deststorepass $STOREPASS \
  -destkeypass $KEYPASS

echo "[3/3] ✔ Done. Keystore saved at $JKS"
keytool -list -v -keystore $JKS -storepass $STOREPASS