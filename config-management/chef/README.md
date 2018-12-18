# Chef

<img src="images/logo.png" />

- **Gerenciador de configuração**
-  Sua arquitetura:
<img src="images/chef_overview.svg" />
<br/>

- Cookbook prontas: https://supermarket.chef.io/dashboard

- **Exemplo**: instalar o Apache em 100 máquinas.
  -É possível fazer um script bash, em seguida acessar máquina por máquina para instalar a aplicação.
    - Com o chef é possível criar uma _recipes_ de instalação do apache e inserir num **cookbook**. Basta executar 1 vez que ele instala nos 100 nodes.
    - Caso seja necessário alterar alguma coisa basta mudar a _recipe_ e reexecutar.

---

## Recipes
São os scripts de instalação e configuração.


#### Example 1:
1. Create _recipe_: hello.rb
```
file 'output_file' do 
	content 'hello world'
end
```

2. Run recipe<br/>
`chef-apply hello.rb`
<img src="images/recipe_hello.png" />

- Será gerado um arquivo chamado motd contendo: hello world

#### Example 2:

1. Create _recipe_: recipe-web-server.rb
```
# install package with apt/dpkg
package 'apache2'

service 'apache2' do
  supports status: true
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content 
  '<html>
	  <body>
	  	<h1>Life is not about how hard of a hit you can give... it is about how many you can take, and still keep moving forward. </h1>
	  </body>
</html>'
end
```
2. Run recipe<br/>
`sudo chef-apply recipe-web-server.rb`

3. Open browser in http://localhost/80 or `curl localhost`

---

## Cookbook
<br/>
<img src="images/chef-configuration.jpg" />

#### Estrutura de diretórios do cookbook
- recipes
- templates
- Resource — é algo que descreve um componente da infraestrutura - arquivo, modelo , pacote etc;
- readme.md
- metada - dados sobre a receita, quem desenvolveu, versões suportadas, version, depends.

Example cookbook install apache:<br/>
```
cookbooks
└── cookbook-web-server-apache
    ├── Berksfile
    ├── CHANGELOG.md
    ├── chefignore
    ├── LICENSE
    ├── metadata.rb
    ├── README.md
    ├── recipes
    │   └── default.rb
    ├── spec
    │   ├── spec_helper.rb
    │   └── unit
    │       └── recipes
    │           └── default_spec.rb
    └── test
        └── integration
            └── default
                └── default_test.rb

8 directories, 10 files

```

### Hands-on

#### Example create cookbooks:
1. Create repository<br/>
`mkdir cookbooks`

2. Create _cookbook_: web-server-apache<br/>
`chef generate cookbook cookbooks/cookbook-web-server-apache`

3. Edit recipe _default.rb_<br/>
```

# Cookbook:: web-server-apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


# install package with apt/dpkg
package 'apache2'

service 'apache2' do
  supports status: true
  action [:enable, :start]
end

file '/var/www/html/index.html' do
  content 
  '<html>
	  <body>
	  	<h1>Life is not about how hard of a hit you can give... it is about how many you can take, and still keep moving forward. </h1>
	  </body>
</html>'
end
```
4. Execute recipe in a cookbook<br/>
`sudo chef-client --local-mode --runlist 'recipe['cookbook-web-server-apache']'`

---



<br/>

<img src="images/arq.png" />







---
## In container

### Pre requeriments:
- docker 
- orquestration containeir

### Install and configuration:
https://docs.chef.io/install_server.html


### Start container:
`docker-compose up -d`<br/>
OBS: -d in background

### Start an interactive Bash session on the `workstation` container:
`docker exec -it workstation bash`

<img src="images/docker-compose.png" />

---

### Problem berks install
`gem update --system 2.7.5`


---
### Fonts
- chaordic CHEF: https://github.com/chaordic/platform-chef-repo
- 