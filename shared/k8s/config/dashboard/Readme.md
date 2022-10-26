# Deploying the Dashboard UI 

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.6.1/aio/deploy/recommended.yaml



# Creating sample user

https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md

kubectl --kubeconfig kubeconf_vagrant proxy

# Link


http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

# token 

`kubectl -n kubernetes-dashboard create token admin-user`
