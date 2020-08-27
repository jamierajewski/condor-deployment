#!/bin/bash

# Add correct permissions to the secrets directory in case they aren't set
chmod 0700 secrets

# Central Manager:
docker run --detach -p 9618:9618 --name=cm \
       -v $(pwd -P)/cm/condor_config.local:/etc/condor/condor_config.local \
       -v $(pwd -P)/cm/create_token.sh:/home/create_token.sh \
       -v $(pwd -P)/secrets:/root/secrets \
       htcondor/cm:8.9.7-el7

# Generate token and store it in /root/secrets/token
docker exec cm /home/create_token.sh

# Submit:
docker run --detach --network host --name=submit \
       -e CONDOR_HOST='localhost:9618' \
       -v $(pwd -P)/secrets:/root/secrets:ro \
       htcondor/submit:8.9.7-el7

# Execute:
docker run --detach --network host --name=execute \
       --env-file=$(pwd -P)/execute/env \
       -e CONDOR_HOST='localhost:9618' \
       --cpus=2 --memory-reservation=$(( 4096 * 1048576 )) \
       -v $(pwd -P)/secrets:/root/secrets:ro \
       htcondor/execute:8.9.7-el7
