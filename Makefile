.PHONY: minikube

minikube:
	minikube start --memory 4096
	helm init
	kubectl rollout status deploy tiller-deploy -n kube-system
	kubectl apply -f https://github.com/jetstack/cert-manager/raw/v0.8.0/deploy/manifests/00-crds.yaml
