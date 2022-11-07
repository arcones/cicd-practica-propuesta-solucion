all: init plan apply

init:
	cd infra && terraform init

plan: 
	cd infra && terraform plan

apply:
	cd infra && terraform apply
