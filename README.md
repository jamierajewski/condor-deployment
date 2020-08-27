# condor-deployment
Docker HTCondor deployment configuration

To run, simply execute launch.sh which will:
- Change secrets to have 0700 permissions
- Launch cm and detach
- Execute create_token.sh on cm which will store it in the mounted secrets dir
- Launch/detach submit and execute, both mounting the secrets dir containing the newly
  generated token
  