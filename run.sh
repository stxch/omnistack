#!/bin/bash
set -e # Faz o script parar se algum comando falhar

# --- ETAPA 1: PREPARAÇÃO DO AMBIENTE ---
echo "==> Etapa 1: Instalando dependências..."
# A LINHA ABAIXO ESTAVA FALTANDO. ELA É ESSENCIAL.
ansible-galaxy collection install -r collections/requirements.yml
pip install -r requirements.txt

# --- ETAPA 2: EXECUÇÃO DA AUTOMAÇÃO ---
echo "==> Etapa 2: Executando o playbook Ansible..."

ansible-playbook \
  -i inventory \
  --extra-vars "vm_count=$vm_count vm_name_prefix='$vm_name_prefix' template_name='$template_name'" \
  deploy.yml

echo "==> FIM DA EXECUÇÃO <=="