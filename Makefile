ENVIRONMENT := dev

helm: ## TEST
	helm template examplechart --output-dir "./environments/$(ENVIRONMENT)/"
