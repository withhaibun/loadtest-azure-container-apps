# loadtest-azure-container-apps
load tests using azure container apps

`az login`, then `az extension add --name containerapp --upgrade`

Then `sh scripts/up-containerapp.sh` to start. On return you'll see an
endpoint, use /status for status, and /run for a sample load test.



