# ON DEVELOPMENT

#get cluster info
kubectl cluster-info

#get node info
kubectl get nodes

#get namespaces
kubectl get namespaces

#get pods
kubectl get pods

#get pods from a specific namespace
kubectl get pods -n kube-system

#gett pod info from a namespace
kubectl describe pod etcd-minikube -n kube-system

#get pods from all namespaces
kubectl get pods --all-namespaces

#create namespace
kubectl create namespace teste

#crete pod on namespace
kubectl run nginx --generator=run-pod/v1 --image=nginx

#something like watch on linux, work on "get"
kubectl get pods -n teste -w

#get more information
kubectl get pods -n teste -o wide
kubectl get pods --all-namespaces -o wide
