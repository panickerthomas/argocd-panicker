# https://www.pcbaecker.com/posts/setup-argocd/
brew install kind
kubectl version --short
kind create cluster -n panicker-infra-k8
kubectl version --short
kubectl create namespace argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm install --namespace argocd argo argo/argo-cd
kubectl port-forward service/argo-argocd-server -n argocd 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d