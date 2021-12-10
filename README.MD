Start Services
--------------

Este projeto contém um script bash básico para iniciar, uma única vez, serviços do systemd durante a abertura do Linux pelo WSL do Windows.

Para que isso seja possível, inicialmente clone o projeto em algum diretório de sua preferência.
Em seguida mova ou copie o arquivo start_services.sh do raiz do projeto para raiz da sua pasta de usuário: /home/USER_NAME onde USER_NAME é o seu nome de usuário.

Se você não sabe qual a pasta home do seu usuário use o comando:
```sh
echo $HOME
```

Copiando para pasta de usuário:

```sh
cp PROJECT_ROOT/wsl-services-starter/start_services.sh $HOME/start_services.sh
```

Observação: PROJECT_ROOT é a pasta onde você clonou este projeto.

Depois disso, é necessário alterar a permissão do arquivo start_services.sh com:

```sh
sudo chmod 0755 start_services.sh
```

Agora, para que o start_services.sh seja executado. Adicione ao final do arquivo .bashrc (Fica também na sua pasta de usuário):

```sh
sudo $HOME/start_services.sh
```

Quase pronto. Mas para que o comando acima possa ser executado pelo seu usuário, como se root fosse (usando sudo), você precisará copiar o arquivo start_services.conf para a pasta de configurações do sudoers.

```sh
sudo cp PROJECT_ROOT/wsl-services-starter/start_services.conf /etc/sudoers.d/start_services.conf
```

Em seguida certifique-se de que as permissões do arquivo acima estejam corretas, rodando:

```sh
sudo chmod 644 /etc/sudoers.d/start_services.conf
```

Você ainda precisa substituir no arquivo start_services.conf o texto USER_NAME pelo nome do seu usuário.

Você pode fazer isso utilizando o comando:

```sh
sed -i "s|USER_NAME|$USER|g" /etc/sudoers.d/start_services.conf
```

Prontinho. Agora toda vez que o seu Linux WSL for iniciado ele irá executar o script start_services.sh, rodando todos os services configurados nele apenas uma vez. Ignorando o start no caso de o serviço já estar em execução/ativo.