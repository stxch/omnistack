#!/bin/bash
# Faz o script parar se algum comando falhar
set -e

# --- ETAPA 1: PREPARAÇÃO DO AMBIENTE ---
echo "==> Etapa 1: Instalando dependências..."
pip install -r requirements.txt

# --- ETAPA 2: EXECUÇÃO DA AUTOMAÇÃO ---
echo "==> Etapa 2: Executando o playbook Ansible..."

# O comando ansible-playbook agora passa as variáveis do formulário para o playbook principal
ansible-playbook \
  -i inventory \
  --extra-vars "vm_count={{.Quantidade_de_VMs_para_criar}} vm_name_prefix='{{.Prefixo_para_o_nome_das_VMs}}' template_name='{{.Nome_do_template_a_ser_clonado}}'" \
  deploy.yml

echo "==> FIM DA EXECUÇÃO <=="