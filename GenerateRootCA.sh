#!/usr/bin/env bash

#enable PKI

vault secrets enable PKI

#Tune the pki secrets engine to issue certificates with a maximum time-to-live (TTL) of 87600 hours.

vault secrets tune -max-lease-ttl=87600h pki

#Generate the root certificate and save the certificate in CA_cert.crt.

vault write -field=certificate pki/root/generate/internal \
        common_name="example.com" \
        ttl=87600h > CA_cert.crt

# Configure the CA and CRL URLs:

$ vault write pki/config/urls \
        issuing_certificates="http://127.0.0.1:8200/v1/pki/ca" \
        crl_distribution_points="http://127.0.0.1:8200/v1/pki/crl"