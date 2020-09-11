#!/bin/bash

# Create the execute token
condor_token_create -authz ADVERTISE_MASTER \
         -authz ADVERTISE_STARTD -authz READ -identity dockerworker@host \
         > /root/secrets/token

# Create the submituser token (stored only on the submit node)
condor_token_create -identity submituser@host \
		    > /root/submitsecrets/token

# Create the schedd daemon token (stored only on the submit node)
condor_token_create -authz ADVERTISE_MASTER -authz ADVERTISE_SCHEDD \
		    -authz READ -identity dockersubmit@host \
		    > /root/scheddsecrets/token
