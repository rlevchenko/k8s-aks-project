#Get Azure AKS Credentials
az login
az aks get-credentials --resource-group kubRg --name rlk8sclu-l3y5

#Open K8S dashboard
kubectl create clusterrolebinding kubernetes-dashboard --clusterrole=cluster-admin --serviceaccount=kube-system:kubernetes-dashboard
az aks browse --resource-group kubRg --name rlk8sclu-l3y5

#View K8S config (.kube/config)
kubectl config view

#Get the node resource group
az aks show --resource-group kubRg --name rlk8sclu-l3y5 --query nodeResourceGroup -o tsv

#Create the disk (static volume task)
az disk create --resource-group MC_kubRg_rlk8sclu-l3y5_westeurope --name rkStaticDisk --size-gb 5 --sku Standard_LRS --query id --output tsv

#Set contexts (test service accounts)
kubectl config set-credentials read-sa --token=$(kubectl get secret read-sa-token-9kvrt --namespace=default --output jsonpath='{.data.token}' | base64 -d)
kubectl config set-context readsa --user=read-sa --cluster=rlk8sclu-l3y5

kubectl config set-credentials ns-read-sa --token=$(kubectl get secret read-sa-ns-token-zqgm6 --namespace=default --output jsonpath='{.data.token}' | base64 -d)
kubectl config set-context nsreadsa --user=ns-read-sa --cluster=rlk8sclu-l3y5

#Get Service's Public IP
kubectl get service -n ns1 -o jsonpath='{.items[].status.loadBalancer.ingress[0].ip}'