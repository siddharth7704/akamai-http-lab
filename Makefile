ANSIBLE_DIR := ansible
INVENTORY := $(ANSIBLE_DIR)/inventory.ini
PLAYBOOK := $(ANSIBLE_DIR)/site.yml
VAULT := $(ANSIBLE_DIR)/vault.yml

.PHONY: help deploy ping facts clean

help:
	@echo ""
	@echo "Available commands:"
	@echo "  make ping      - Test Ansible connectivity"
	@echo "  make facts     - Gather server facts"
	@echo "  make deploy    - Run full provisioning playbook"
	@echo "  make clean     - Remove temporary Ansible files"
	@echo ""

ping:
	ansible lab \
	-i $(INVENTORY) \
	-m ping \
	--extra-vars="@$(VAULT)" \
	--ask-vault-pass

facts:
	ansible-playbook \
	-i $(INVENTORY) \
	$(PLAYBOOK) \
	--extra-vars="@$(VAULT)" \
	--ask-vault-pass

deploy: facts

clean:
	find . -name "*.retry" -delete