# Kubernetes in Azure (AKS) - Configuration and Application service deployment

## What's included:

- Blog post: https://rlevchenko.com/2019/09/05/playing-with-kubernetes-running-on-azure-aks/
- aspnetapp - .NET Core application 
- aspnetapp/dockerfile - builds docker image with aspnetapp
- ns1 and ns2 folders are related to K8S namespaces and include scripts
- auth.sh - K8S authentication (grants AKS access to ACR)
- k8s_config.ps1 - PowerShell commands to set AKS cluster
- sa.yaml - manifest file to configure AKS cluster and namespaces

## Where to use:

- as a part of CI/CD pipelines (Azure DevOps, for example)
- manual deployment (kubectl/azure cli/powershell)

## Azure DevOps workflow

- Builds and pushes docker image to Azure Container Registry
- Configures Kubernetes Namespaces (limits, scale options and etc.)
- Creates a new deployment and sets anti-affinity for pods
- Sets Network Policies (traffic between NS and from PODs)
- Adds service accounts on Namespace and Cluster levels 
- Creates a service and publishes it

## Azure DevOps Pipeline
![image](https://rlevchenko.files.wordpress.com/2019/09/azure-devops-aks-pipeline.jpg)
