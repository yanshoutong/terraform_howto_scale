.PHONY: clean plan apply show destroy

plan: clean
	terraform plan -var "region=cn-zhangjiakou" -var "zone=cn-zhangjiakou-a" -var "scale_count=3"

apply: clean
	terraform apply -var "region=cn-zhangjiakou" -var "zone=cn-zhangjiakou-a" -var "scale_count=3"

show:
	terraform show -json

destroy:
	terraform destroy -auto-approve

clean:
	-rm -f *~
