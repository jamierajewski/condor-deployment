#!/bin/bash

# Create the token
condor_token_create -authz ADVERTISE_MASTER \
         -authz ADVERTISE_STARTD -authz READ -identity dockerworker@jamie \
         >> /root/secrets/token
