#!/usr/bin/env bash

#A role is a logical name that maps to a policy used to generate those credentials. It allows configuration parameters to control certificate common names, alternate names, the key uses that they are valid for, and more.
# in this you will create a role called exmaple-dot-com

vault write pki_int/roles/example-dot-com \
        allowed_domains="example.com" \
        allow_subdomains=true \
        max_ttl="720h"