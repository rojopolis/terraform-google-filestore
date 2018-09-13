#!/bin/bash

# Script to query filestore for ip address

# Exit if any of the intermediate steps fail
set -e


RESULT="$(gcloud beta filestore instances describe \
          $1 \
          --project=$2 \
          --location=$3 \
          --format=json | \
          jq -r '.networks[0].ipAddresses[0]')"

jq -r -n --arg result "$RESULT" '{"ipAddress":$result}'
