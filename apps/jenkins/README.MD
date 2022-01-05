####
https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-kubernetes

https://quickwinsit.com/2021/12/08/como-colocar-o-jenkins-rodando-no-kubernetes/

https://kubernetes.io/pt-br/docs/reference/access-authn-authz/authentication/

kubectl get pods --all-namespaces

kubectl create namespace {namespace}

kubectl get pods --namespace {namespace}

kubectl get nodes -o wide

kubecl get namespaces

kubectl delete --all pods --namespace=default

kubectl cluster-info

######

https://devopscube.com/jenkins-build-agents-kubernetes/


criacao de namespace / serviceaccount jenkins com output token

kubectl create namespace jenkins && kubectl create serviceaccount jenkins --namespace=jenkins && kubectl describe secret $(kubectl describe serviceaccount jenkins --namespace=jenkins | grep Token | awk '{print $2}') --namespace=jenkins && kubectl create rolebinding jenkins-admin-binding --clusterrole=admin --serviceaccount=jenkins:jenkins --namespace=jenkins
