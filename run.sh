#!/bin/bash
set -e

# CORREÇÃO: Encontra o diretório de trabalho correto e entra nele
WORKDIR=$(find /tmp/semaphore/ -maxdepth 1 -type d -name "repository_*" | head -n 1)
cd "$WORKDIR"

# --- ETAPA 1: PREPARAÇÃO DO AMBIENTE ---
echo "==> Etapa 1: Instalando dependências..."
ansible-galaxy collection install -r requirements.yml
pip install -r requirements.txt

# --- ETAPA 2: EXECUÇÃO DA AUTOMAÇÃO ---
echo "==> Etapa 2: Executando o playbook Ansible..."
ansible-playbook \
  -i inventory \
  --extra-vars "vm_count=$vm_count vm_name_prefix='$vm_name_prefix' template_name='$template_name'" \
  deploy.yml

echo "==> FIM DA EXECUÇÃO <=="