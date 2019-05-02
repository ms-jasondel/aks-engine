aks-engine upgrade --force --subscription-id 57052a80-f184-4850-9b7b-26d0db87a707 \
    --auth-method client_secret \
    --resource-group jasondel-akse \
    --location eastus \
    --upgrade-version 1.14.1 \
    --api-model ./_output/jasondel-akse/apimodel.json \
    --client-id="XXX" \
    --client-secret="XXX"


git filter-branch --force --index-filter \
  'git rm --cached --ignore-unmatch aks-e-upgrade.sh' \
  --prune-empty --tag-name-filter cat -- --all