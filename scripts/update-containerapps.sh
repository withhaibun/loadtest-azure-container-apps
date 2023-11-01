time az containerapp update \
    --name ca-test-haibun \
    --resource-group rg-test-haibun \
    --min-replicas 0 \
    --max-replicas 50 \
    --scale-rule-name azure-http-rule \
    --scale-rule-type http \
    --scale-rule-http-concurrency 1
