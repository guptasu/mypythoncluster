#!/bin/bash
# Usage:
# For creating a basic cluster
# resize.sh <POOL_NAME> <POOL_SIZE>
# e.g. resize data-primary 4
# ** NOTE This script expects the following environment variables to be set
# - PROJECT
# - CLUSTER_NAME
# - CLUSTER_ZONE
#
POOL_NAME=$1
SIZE=$2
gcloud container clusters resize $CLUSTER_NAME --node-pool $POOL_NAME --size $SIZE --project $PROJECT --zone $CLUSTER_ZONE -q

