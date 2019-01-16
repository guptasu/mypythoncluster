echo publishing $1 to $GCR_PROJECT
docker pull $1
GCP_REGISTRY_PATH=gcr.io/$GCR_PROJECT/$1
docker tag $1 GCP_REGISTRY_PATH
gcloud docker -- push $GCP_REGISTRY_PATH
echo use the new image at : $GCP_REGISTRY_PATH

