#!/bin/bash
set -e # Faz o script parar se algum comando falhar

# Etapa 1: Preparar o Ambiente
echo "--- Etapa 1: Instalando dependências Ansible e Python ---"
ansible-galaxy collection install -r collections/requirements.yml
pip install -r requirements.txt

# Etapa 2: Executar o Playbook
echo "--- Etapa 2: Executando o playbook Ansible ---"
ansible-playbook \
  -i inventory \
  --extra-vars "vm_count={{.Quantidade_de_VMs_para_criar}} vm_name_prefix='{{.Prefixo_para_o_nome_das_VMs}}' template_name='{{.Nome_do_template_a_ser_clonado}}'" \
  deploy.yml