set -o errexit
set -o nounset

kubectl create clusterrolebinding $USER-cluster-admin-binding --clusterrole=cluster-admin --user=$USER@google.com || true
# Create 'metacontroller' namespace, service account, and role/binding.
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/metacontroller/master/manifests/metacontroller-rbac.yaml
# Create CRDs for Metacontroller APIs, and the Metacontroller StatefulSet.
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/metacontroller/master/manifests/metacontroller.yaml

kubectl create namespace $1 || true
kubectl  -n $1 apply -f cluster/controller_crd.yaml
kubectl  -n $1 apply -f cluster/controller.yaml
kubectl -n $1 create configmap hello-controller --from-file=controller/hook.py
kubectl -n $1 apply -f cluster/hook.yaml 
