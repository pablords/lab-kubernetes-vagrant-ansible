<p align="center">
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-como-executar">Como executar</a>&nbsp;&nbsp;&nbsp;
</p>


<br>

<p align="center">
  <img alt="print" src=".github/teste.png" width="100%">
</p>


<br>

## ✨ Tecnologias

Esse projeto foi desenvolvido com as seguintes tecnologias:

- [Vagrant](https://www.vagrantup.com/)
- [Ansible](https://www.ansible.com/)
- [Docker](https://docs.docker.com/)
- [Kubernetes](https://kubernetes.io/pt-br/)
- [VitualBox](https://www.virtualbox.org/)

## 💻  Como executar

- Clone o repositório.
- Na raiz do projeto digite `vagrant up` e aguarde até que todas vms são provisionadas.
- Para acessar alguma vm é só digitar o comando `vagrant ssh {nome_vm}`.
- Para rodar a aplicacão de teste Wordpress com Mysql acesse a vm master e digite o comando: `cd /home/vagrant/apps/wordpress && kubectl apply -k .`
- Aguarde subir os pods e acesse `http://192.168.50.10:30005`

