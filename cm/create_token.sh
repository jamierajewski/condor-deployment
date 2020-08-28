#!/bin/bash

# # Create the execute token
# condor_token_create -authz ADVERTISE_MASTER \
#          -authz ADVERTISE_STARTD -authz READ -identity dockerworker@jamie \
#          > /root/secrets/token

# Create the submituser token (stored only on the submit node)
condor_token_create -identity submituser@jamie \
		    > /root/submitsecrets/token

