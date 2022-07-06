Ansible es un motor open source que automatiza los procesos para preparar la infraestructura, gestionar la configuración, implementar las aplicaciones y organizar los sistemas, entre otros procedimientos de TI.

Con la automatización que ofrece Ansible, puede instalar los sistemas de software, automatizar las tareas diarias, preparar la infraestructura, mejorar la seguridad y el cumplimiento, ejecutar parches en los sistemas y compartir la automatización en toda la empresa.

# Material de aprendizaje.

https://ttl255.com/jinja2-tutorial-part-1-introduction-and-variable-substitution/


Examples:

# macos_installpacks.yaml

Notas: Cuando se ejecuta puede salir un error 
Error: Fetching /usr/local/Homebrew/Library/Taps/chef/homebrew-chef failed
esto se soluciona ejecutando un brew update-reset, esto lo podriamos incluir en las mismas tareas de ansible (estoy aprendiendo, asi que lo dejare cuando haya soltado mas la mano con respecto al codigo usado.)

# install update & upgrade software en hosts (vere si puede detectar OS versiones etc al respecto)

pve-exec.yaml

Notas: es un simple yaml que nos permite acceder a nodos proxmox y ejecutar tareas apt update && apt dist-upgrade -y, adicionalmente quiero detectar OS systems asi poder realizar tareas de upgrade de forma masiva.


## deploy (aca veremos algun deploy de puede ser un nginx, y alguna pagina demo para posteriormente agregar MySQL y otros servicios complementarios al mismo deploy).

Notas: