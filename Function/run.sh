#!/bin/bash

echo "cmd:"
echo "./run.sh func_name deploy/local"
echo "targeting function: $1"

export GOOGLE_APPLICATION_CREDENTIALS="~/workspace/key.json"

if [ $2 = "deploy" ]; then
    gcloud functions deploy $1 --entry-point $1 --runtime nodejs14 --trigger-http
elif [ $2 = "local" ]; then
    npx @google-cloud/functions-framework --target=$1
fi
