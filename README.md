# DevOps

![devops](https://img.shields.io/badge/Dev-Ops-blue.svg)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3a8c68906dba4076bf0b74a2fced61c8)](https://app.codacy.com/app/brunocampos01/devops?utm_source=github.com&utm_medium=referral&utm_content=brunocampos01/devops&utm_campaign=Badge_Grade_Dashboard)
![License](https://img.shields.io/badge/Code%20License-MIT-blue.svg)
![github](https://img.shields.io/badge/Control%20Version-GitHub-brightgreen.svg)


<img src='images/devops.png' align="right" height=auto width=50%>


# Summary

- :penguin:**Linux**:penguin:
  - [Home Sweet home](https://github.com/brunocampos01/home-sweet-home)
  - [Shell Script]() # learning
  - [Network](#network)
  - [My Problems]() # create repository LINUX
    - [Agent Refused Operation](#agent-refused-operation)

- **Infrastructure As Code and Configuration Management** :computer: :computer: :computer:
  - [Scripts]() # learning
  - [Chef](infra-as-code/chef/)
  - [Ansible](infra-as-code/ansible) # learning

- **Control Version** :black_circle::heavy_minus_sign::black_circle::heavy_minus_sign::red_circle:
  - Files Git
    - [Local Directory: .git]()
    - [.gitconfig](git/.gitconfig)
    - [.gitignore](git/gitignore-models)
    - [.gitattributes](git/) # in production
    - [.gitkeep](git/) # in production
  
  - Good Pratices :bookmark_tabs:
    - [Writing Commits](git/) 
    - [Writing Branches](git/) # in production
    - [Writing Readme](https://github.com/brunocampos01/DevOps/blob/master/github/como-escrever-README.md)
    - [Coding Styles: .editorconfig](git/.editorconfig)
    - [Types of LICENSE](https://choosealicense.com/)

  - Documentation (markdown) :page_with_curl:
    - [Basic writing](https://help.github.com/en/articles/basic-writing-and-formatting-syntax)
    - [Style guide](https://github.com/DavidAnson/markdownlint/blob/v0.13.0/doc/Rules.md#md025)
    - [Emojis](https://gist.github.com/rxaviers/7360908)
    - [Images](#images)
    - [Shields](https://shields.io/category/build)

- **Virtualization** :shell:
  - [Fundamentals]()
  - [Virtual Environment Python](#virtual-environment-python) :snake:
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

- **Monitoring** :hourglass_flowing_sand: :chart_with_upwards_trend:
    - In production ...

- **Logs** :page_facing_up:
    - In production ...

------
------

# Linux

## Processing Files and Data

- For JSON, use [`jq`](http://stedolan.github.io/jq/). For interactive use, also see [`jid`](https://github.com/simeji/jid) and [`jiq`](https://github.com/fiatjaf/jiq).

- For YAML, use [`shyaml`](https://github.com/0k/shyaml).

- For Excel or CSV files, [csvkit](https://github.com/onyxfish/csvkit) provides `in2csv`, `csvcut`, `csvjoin`, `csvgrep`, etc.

- For Amazon S3, [`s3cmd`](https://github.com/s3tools/s3cmd) is convenient and [`s4cmd`](https://github.com/bloomreach/s4cmd) is faster. Amazon's [`aws`](https://github.com/aws/aws-cli) and the improved [`saws`](https://github.com/donnemartin/saws) are essential for other AWS-related tasks.

- Know about `sort` and `uniq`, including uniq's `-u` and `-d` options -- see one-liners below. See also `comm`.

- Know about `cut`, `paste`, and `join` to manipulate text files. Many people use `cut` but forget about `join`.

- Know about `wc` to count newlines (`-l`), characters (`-m`), words (`-w`) and bytes (`-c`).

- Know about `tee` to copy from stdin to a file and also to stdout, as in `ls -al | tee file.txt`.

- For more complex calculations, including grouping, reversing fields, and statistical calculations, consider [`datamash`](https://www.gnu.org/software/datamash/).

## Network

### Check DNS
```sh
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
```sh
scp user@remote_host:remote_file local_file
```

#### upload: local -> remote
```sh
scp local_file user@remote_host:remote_file
```

##### Example

```sh
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
`< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-10};`
```
## Images in Markdown

- Responsive Images
Use `height=auto`

```
<img src="images/git_logo.png" align="right" height=auto width=30%/>
```

- align
`align=left`

<img src="images/devops.png" align="left" height=auto width=30%/>

<img src="images/devops.png" align="middle" height=auto width=30%/>

<img src="images/devops.png" align="right" height=auto width=30%/>

Line Test ...

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
- https://github.com/jlevy/the-art-of-command-line/blob/master/README.md

---

## Author
- Bruno Aurélio Rôzza de Moura Campos (brunocampos01@gmail.com)

## Copyright
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Bruno A. R. M. Campos</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
