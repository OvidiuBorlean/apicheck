#!/bin/bash
APISERVER=https://aks-aks-aa1792-2b26b80f.hcp.westeurope.azmk8s.io
SERVICEACCOUNT=/var/run/secrets/kubernetes.io/serviceaccount
NAMESPACE=$(cat ${SERVICEACCOUNT}/namespace)
TOKEN=$(cat ${SERVICEACCOUNT}/token)
CACERT=$SERVICEACCOUNT/ca.crt
while true
  do
     STATUS=$(curl -sS -m 10 --cacert ${CACERT} --header "Authorization: Bearer ${TOKEN}" -X GET ${APISERVER}:443/livez)
     DATE="$(date)"
     echo "Status = \ $STATUS - Date = $DATE"
     sleep 10
done