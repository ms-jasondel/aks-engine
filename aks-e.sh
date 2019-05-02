aks-engine deploy --subscription-id 57052a80-f184-4850-9b7b-26d0db87a707 \
    --auth-method cli \
    --dns-prefix jasondel-akse \
    --resource-group jasondel-akse \
    --location eastus \
    --api-model ./kubernetes.json \
    --set servicePrincipalProfile.clientId="XXX" \
    --set servicePrincipalProfile.secret="XXX"