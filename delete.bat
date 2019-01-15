set -o errexit
set -o nounset

kubectl create clusterrolebinding $USER-cluster-admin-binding --clusterrole=cluster-admin --user=$USER@google.com || true
kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/metacontroller/master/manifests/metacontroller.yaml
kubectl delete -f https://raw.githubusercontent.com/GoogleCloudPlatform/metacontroller/master/manifests/metacontroller-rbac.yaml

kubectl delete namespace test
kubectl delete pod --all
kubectl delete crd myclusters.example.com
