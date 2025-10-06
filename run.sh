#!/bin/bash
set -e

# GARANTE QUE ESTAMOS NO DIRETÓRIO CERTO
cd /tmp/semaphore/project_1/repository_*

# --- ETAPA 1: PREPARAÇÃO DO AMBIENTE ---
echo "==> Etapa 1: Instalando dependências..."
ansible-galaxy collection install -r requirements.yml # Agora aponta para o arquivo na raiz
pip install -r requirements.txt

# --- ETAPA 2: EXECUÇÃO DA AUTOMAÇÃO ---
echo "==> Etapa 2: Executando o playbook Ansible..."
ansible-playbook \
  -i inventory \
  --extra-vars "vm_count=$vm_count vm_name_prefix='$vm_name_prefix' template_name='$template_name'" \
  deploy.yml

echo "==> FIM DA EXECUÇÃO <=="