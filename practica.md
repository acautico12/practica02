# Practica02 Miguel Ángel Vargas Hernández

## Creación de una máquina virtual con VAGRANT

En esta práctica vamos a aprender a crear una máquina virtual con el programa Vagrant. Es un programa pensado para automatizar el despliegue de máquinas virtuales mediante archivos de texto.

Para ello vamos a necesitar una carpeta donde vamos a añadir todos los archivos de configuración de Vagrant y de la máquina virtual.

### Paso 1: Creación del archivo Vagrantfile

Para configurar las máquinas virtuales de Vagrant, necesitamos su archivo de configuración, en el cual especificaremos todo el HW y configuración de este, la red y el S.O. que utilizaremos.

Para crear el archivo **Vagrantfile** debemos de ejecutar el siguiente comando dentro de la carpeta donde tendremos todos los archivos de configuración de nuestra máquina virtual:
```
vagrant init
```

Este comando nos generará un archivo de texto, el cual modificaremos con cualquier editor de texto. Este archivo está escrito en un lenguaje de programación llamado Ruby.
En el archivo de configuración, los parámetros más importantes son:
   
    - config.vm.box: El cual es el parámetro que indica el S.O. que ejecutará la máquina o máquinas que declaremos en el archivo Vagrantfile.

    -config.vm.network: El cual es el parámetro que indica que tipo de red tendrán nuestra máquina virtual (pública, privada,...) así como la IP que tendrá la máquina.

    -config.vm.provision: El cual es el parámetro que indica si nuestra máquina después de instalarse debe de ejecutar alguna orden o algún/os scripts y el interprete de comandos que lo ejecuta.

Para instalar nuestra máquina, diremos que el box que usaremos será el **"ubuntu/bionic64"** el cuál hemos sacado de la [página oficial de Vagrant](https://app.vagrantup.com/boxes/search).

El tipo de red será **"private_network"** y determinaremos una IP. 

Y por último determinaremos que los scripts a ejecutar en la post instalación estará en un archivo llamado **"script.sh"** y se ejecutará bajo el interprete de comandos **"shell"**.