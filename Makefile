.PHONY: minikube

minikube:
	minikube start --memory 4096
	helm init
	kubectl rollout status deploy tiller-deploy -n kube-system
