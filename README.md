# DevOps

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3a8c68906dba4076bf0b74a2fced61c8)](https://app.codacy.com/app/brunocampos01/devops?utm_source=github.com&utm_medium=referral&utm_content=brunocampos01/devops&utm_campaign=Badge_Grade_Dashboard)
![License](https://img.shields.io/badge/Code%20License-MIT-blue.svg)
![License](https://img.shields.io/badge/Control%20Version-GitHub-brightgreen.svg)

<img src='images/devops.png'>


# Summary

- **Linux** :penguin:
    - [Home Sweet home]()
    - [Shell Script]()
    - [Network]()
    - [My Problems]() # create repository LINUX
        - [Agent Refused Operation](#agent-refused-operation)


- **Infrastructure As Code and Configuration Managemen** :computer: :computer: :computer: :computer: :computer:
    - [Scripts]()
    - [Chef]()
    - [Ansible]()

- **Control Version**
:black_circle::heavy_minus_sign::black_circle::black_circle: 

    - [Installing git](https://github.com/brunocampos01/DevOps/tree/master/github#git-instalation)
    - [Commands git](https://github.com/brunocampos01/DevOps/blob/master/github/README.md)
    - [Types of LICENSE](https://choosealicense.com/)
    - [Models](https://github.com/brunocampos01/DevOps/tree/master/github/modelos-gitignore)

    - **Good Pratices**
        - [Commits](https://github.com/brunocampos01/DevOps/blob/master/github/como-escrever-COMMITS.md)
        - [Branches]()
        - [Readme](https://github.com/brunocampos01/DevOps/blob/master/github/como-escrever-README.md)
        - [.editorconfig]()
    - Files Git
        - [.gitconfig]()
        - [.gitignore]()
        - [.gitattributes]()
        - [.gitkeep]()

    - Documentation
        - [Markdown: style guide](https://github.com/DavidAnson/markdownlint/blob/v0.13.0/doc/Rules.md#md025)
        - [Markdown: emojis](https://gist.github.com/rxaviers/7360908)



- **Virtualization**
    - [Fundamentals]()
    - [Virtual Environment Python](#virtual-environment-python)
    - [Containers](#containers)
        - [Fundamentals]()
        - Files Docker
            - [dockfile]()
            - [dockerignore]()
    
        - [Docker Comands](#docker-commands)

    - [Orchestrators](#orchestrators)
        - [Mesos](#Mesos)
        - [Marathon](#managemant-libraries)

    - [Cloud](#cloud)
        - [AWS CLI](#awscli)
        - [S3](#s3)
        - [EC2](#ec2)
        - [Secutiry](#s3)
            - [VPC](#VPC)
            - [Security Group](#security-group)



- **Continuos Integration and Continuous Delivery**
    - [Crontab](#crontab)
    - [Jenkins](#jenkins)
    - [Rundeck](#rundeck)

- Monitoring 
:hourglass_flowing_sand:
:chart_with_upwards_trend: 

- Logs :page_facing_up:
...

------
------

# Linux

## Network

### Check DNS
```bash
host localhost    # return IP

# localhost has address 127.0.0.1
# localhost has IPv6 address ::1
```

### Check PORT
```bash
telnet 192.168.0.1 3306
```

### Copy file localhost to remote-machine
##### download: remote -> local
```bash
scp user@remote_host:remote_file local_file
```

#### upload: local -> remote
```bash
scp local_file user@remote_host:remote_file
```

##### Example

```bash
scp lojas_xxx.csv brunorozza@yarn.systems.com:/home/brunorozza
lojas_xxx.csv
```

#### Check acess
- DNS lookup utility
```bash
dig my-addr-aws.net

# return SUCCESS
#
# ; <<>> DiG 9.11.5-P1-1ubuntu2.4-Ubuntu <<>> my-addr-aws.net
# ;; global options: +cmd
# ;; Got answer:
# ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 10448
# ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

# ;; OPT PSEUDOSECTION:
# ; EDNS: version: 0, flags:; udp: 65494
# ;; QUESTION SECTION:
# ;my-addr-aws.net.			IN	A

# ;; ANSWER SECTION:
# my-addr-aws.net.		43200	IN	A	150.162.2.10
...
```

--- 

## Random Themes

### Generate Key
```bash
`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};`
```


**References:**<br/>

---

# Virtualization

## Containers
- Docker Hub – para armazenamento público de “Docker Images”;
- Docker Registry – para armazenar imagens em ambiente on-premises;
- Docker Cloud – um serviço gerenciado para criar e executar contêiner;
- Docker Datacenter – como uma oferta comercial que incorpora muitas tecnologias Docker.


#### Docker Comands
- Run container: 
```
docker run [OPTIONS] CONTAINER [CONTAINER...]
```

- Stop container: 
```
docker stop [OPTIONS] CONTAINER [CONTAINER...]
```

**References:**<br/>
- Documentation: https://docs.docker.com/engine/reference/commandline/docker/

---

### Orchestrators

#### Mesos (Cluster resource manager)
É um orquestrador de containers assim como kubernetes ou Docker Swarm
    - Vantagens:  a orientação a microsserviços, grande volume de dados, análise em tempo real e dimensionamento elástico.
    - Simplificar a alocação de recursos, proporcionando uma aplicação coerente e experiência operacional através de nuvens privadas ou públicas;
    - Manter diversas tarefas de projeto na mesma infraestrutura como: analytics, microsserviços, monitoração, dados distribuídos e até aplicações (tentando melhorar a utilização e reduzir os custos);

#### Marathon
A manager for Mesos, with a nice user interface to start/monitor apps)

**References:**<br/>
https://www.infoq.com/br/presentations/infraestrutura-e-criacao-de-apis-em-alta-escala-usando-docker-e-apache-mesos?utm_source=infoq&utm_medium=related_content_link&utm_campaign=relatedContent_undefined_clk#downloadPdf

---


## Cloud


### Configuration

##### Install client aws
```bash
pip install awscli
```


##### Configure AWS CLI
```bash
aws configure

AWS Access Key ID [None]: KKKKKKKKKKKKKKKKK
AWS Secret Access Key [None]: KKKKKKKKKKKKK
Default region name [None]:
Default output format [None]: json
```

##### Test
```bash
aws s3 ls
```

---

### S3
- Buckets or database _key-value_
- Policy of storage:
    - **Standard:** armazenamento de objetos com altos níveis de resiliência, disponibilidade e performance para dados acessados com frequência.
    - **Glacier:** custo extremamente baixo

- Protocol s3a


#### Access Buckets with AWS-cli
- `aws s3`
```bash
aws s3 ls s3://directory/sub-directory/
```

```bash
aws s3 cp /home/bruno/papyrus/gerar-dump/tmp/ s3://testes-bruno/ --recursive
```

- `s3cmd`

```bash
aws s3 cp /home/bruno/papyrus/gerar-dump-clients-s3/tmp/ s3://giancarlo/testes-bruno/ --recursive
```

- `s4cmd`

```bash
s4cmd ls s3://dumps/hourly/busca/2015/05/33/*/* | cut -d'/' -f10 | sort | uniq | wc -l
```

```bash
s4cmd put /home/bruno/papyrus/gerar-dump-clients-s3/tmp/* s3://giancarlo/testes-bruno/

# Copy file localhost to remote-bucket
```


### EC2 
...


### Route 53
Create route intern in DNS. Help transparent IP by users with uses.

- create in hosted zones intern `my-addr.aws.net`
- Next step click in `create record set`
- Test<br/>
```bash
dig my-addr.aws.net

# return
# ; <<>> DiG 9.10.3-P4-Ubuntu <<>> my-addr.aws.net
# ;; global options: +cmd
# ;; Got answer:
# ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42012
# ;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

# ;; OPT PSEUDOSECTION:
# ; EDNS: version: 0, flags:; udp: 4096
# ;; QUESTION SECTION:
# ;my-addr.aws.net IN	A

# ;; ANSWER SECTION:
# my-addr.aws.net 60	IN  CNAME   mysqldatabasename.blabla.us-east-1.rds.amazonaws.com.
# mysqldatabasename.blabla.us-east-1.rds.amazonaws.com. 5 IN A 172.28.157.98
```


## Security
...

### VPC
É uma rede virtual privada (similar a uma VLAN). Usado para executar serviços aws isolados.

### Security Group
...

---

# Continuos Integration and Continuous Delivery 

- Crontab
- Jenkins
- Rundeck

**References:**<br/>

---

## Author
- Bruno Aurélio Rôzza de Moura Campos (brunocampos01@gmail.com)
## Copyright
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Bruno A. R. M. Campos</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
