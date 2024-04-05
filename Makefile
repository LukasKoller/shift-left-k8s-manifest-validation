ENVIRONMENT := dev

helm-template:
	helm template examplechart --output-dir ./tmp && mv ./tmp/examplechart/templates/* "./environments/$(ENVIRONMENT)/manifests" && rm -rf ./tmp

minikube/apply-crd:
	kubectl apply -f "./environments/$(ENVIRONMENT)/manifests"

validate/native:
	kubectl-validate "./environments/$(ENVIRONMENT)/manifests/deployment.yaml"

validate/cluster-crd:
	kubectl-validate "./environments/$(ENVIRONMENT)/manifests/crontab.yml" --kube-context minikube-shift-left

validate/local-crd:
	kubectl-validate "./environments/$(ENVIRONMENT)/manifests/crontab.yml" --local-crds "./environments/$(ENVIRONMENT)/manifests"

validate/local-openapi-schemas:
	kubectl-validate "./environments/$(ENVIRONMENT)/manifests/crontab.yml" --local-schemas "./environments/$(ENVIRONMENT)/manifests"
