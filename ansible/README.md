#####
Para verificar info de hosts

ansible -i hosts master -m setup --inventory-file ${inventory}

#####

Caso nao consiga listar inventario, executar o seguinte comando

export ANSIBLE_HOST_KEY_CHECKING=False && ansible-playbook -i