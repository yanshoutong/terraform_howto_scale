.PHONY: clean show destroy

plan_zjk: clean
	terraform plan -var "region=cn-zhangjiakou" -var "zone=cn-zhangjiakou-a" -var "scale_count=1"

apply_zjk: clean
	terraform apply -var "region=cn-zhangjiakou" -var "zone=cn-zhangjiakou-a" -var "scale_count=1"


plan_hhht: clean
	terraform plan -var "region=cn-huhehaote" -var "zone=cn-huhehaote-a" -var "scale_count=1"

apply_hhht: clean
	terraform apply -var "region=cn-huhehaote" -var "zone=cn-huhehaote-a" -var "scale_count=1"


show:
	terraform show -json

destroy:
	terraform destroy -auto-approve

clean:
	-rm -f *~
