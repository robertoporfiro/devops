## Simulado
- https://www.udemy.com/course/simulado-certificacao-az-900/
- https://www.udemy.com/course/simulado-para-a-prova-az-900/

### Cursos
- https://www.udemy.com/course/introducao-ao-microsoft-azure-certificacao-az-900/
- https://www.udemy.com/course/microsoft-azure-beginners-guide/
- https://docs.microsoft.com/en-us/learn/paths/azure-fundamentals/
- https://github.com/AzureMentor/Azure-AZ-900-Study-Guide

### Link da prova
- https://wsr.pearsonvue.com/testtaker/registration/Dashboard/MICROSOFT

### Como a prova funciona
- https://www.youtube.com/watch?v=Vb0OGIH-2MM&list=PLahhVEj9XNTceGnF19qSjYxYzS4S_Wlmf&index=2&t=0s
- https://www.youtube.com/watch?v=k9qDZ4gnjtA

### English Trainning
- https://www.udemy.com/course/curso-de-ingles-para-ti/

---

## Cronograma

- Sunday: overview
- Monday: Understand core Azure services (35%)
- Tuesday: Understand core Azure services (35%)
- Wednesday: Understand security, privacy, compliance, and trust (30%)
- Thursday: Understand security, privacy, compliance, and trust (30%)
- Friday: Understand Azure Pricing and Support (25%)
- Saturday: Review

---

# Understand Cloud Concepts (20%)
- Cloud Terms
- Principles of Economies of Scale
- Difference between Capital Expenditure (CapEx) and Operational Expenditure (OpEx)
- Consumption-based model
- IaaS, PaaS and SaaS
- Difference between public, private and hydrid cloud

# Understand core Azure services (35%)
- Architectural
  - Regions
  - Avaalibily Zones
  - Resource Groups
  - Resource Manager
- Products
  - VM
  - VM scale
  - Service Functions
  - Container Instance
  - Kubernetes Service
  - Virtual Network
  - Load Balancer
  - VPN 
  - Gateway
  - Content Delivery Network
  - Blob Storage
  - Disk Storage
  - File Storage
  - Archive Storage
  - Azure Marketplace and its usage scenarios
- Solutions
  - IoT
  - SQL Data Warehouse
  - HDInsight
  - Azure Databricks
  - Azure Machine Learning Service and Studio
  - Logic Apps
  - Event Grid
  - Azure DevOps
  - Azure DevTest Labs
- Tools
  - Azure Portal
  - Azure PowerShell
  - Azure CLI
  - Cloud Shell
  - Azure Advisor

# Understand security, privacy, compliance, and trust (30%)
- Network Security Groups (NSG)
- Application Security Groups (ASG)
- User Defined Rules (UDR)
- Azure Firewall
- Azure DDoS Protection
- Choose an appropriate Azure security solution 
- Understand the difference between authentication and authorization
- Azure Active Directory
- Azure Multi-Factor Authentication
- Azure Security Center
- Key Vault
- Azure Information Protection (AIP)
- Azure Advanced Threat Protection (ATP)
- Azure Monitor
- Azure Service Health
- Understand the use cases and benefits of Azure Monitor and Azure Service Health

---

## AZ-900: Understand Cloud Concepts (20%)

### Cloud Concept
- Scalability — The application running in the cloud can expand its size when there are more users in the system.

- Elasticity — The application running in the cloud can shrink its size when there are fewer users in the system. The users can also set automatic shutdown during the non-business hours to save money.

### Capital expenditure (CapEx) versus operational expenditure (OpEx)
O Capital expenditure garante custos fixos para compras a longo prazo. Isto torna a melhor escolha quando o budget é limitado.
- CapEx computing costs
 - Server
 - Storage
 - Network
 - Backup
 - disaster recovery
 
O operational expenditure são custos de curto prazo.
- OpEx cloud computing costs
  - Leasing software
  - usage/demand instead of fixed hardware
  - Billing at the user or organization level

Quando não se sabe a demand e growth a melhor escolha é o OpEx

<img src="images/3c-capexvsopex.png" align="center" height=auto width=100%/>


#### Reference
- https://docs.microsoft.com/en-us/learn/modules/principles-cloud-computing/3c-capex-vs-opex

### IaaS, PaaS and SaaS

<img src="images/cloud_services.png" align="center" height=auto width=100%/>

###  Difference between public, private and hydrid cloud
The cloud deployment model you choose depends on your budget, and on your security, scalability, and maintenance needs.

#### Public Cloud
Microsoft Azure is an example of a public cloud provide

Advantages
- High scalability/agility 
- Pay-as-you-go pricing – you pay only for what you use, no CapEx costs
- You're not responsible for maintenance or updates of the hardware

Disavantages
- specific security requirements 
- You don't own the hardware or services and cannot manage them as you may want 

#### Private Cloud
You create a cloud environment in your own datacenter.

Advantages
- You have control (and responsibility) over security
- You can ensure the configuration can support any scenario or legacy application

Disavantages
- You have some initial CapEx costs and must purchase the hardware for startup and maintenance
- Owning the equipment limits the agility - to scale you must buy, install, and setup new hardware

#### Hybrid Cloud
A hybrid cloud combines public and private clouds, allowing you to run your applications in the most appropriate location.

Advantages
- You have flexibility with what you run locally versus in the cloud
- You can use your own equipment to meet security

Disavantages
- It can be more complicated to set up and manage
- You have some initial CapEx costs

---

# Understand core Azure services (35%)
## Architectural
  - Regions
  - Avaialibility Zones
  - Resource Groups
  - Resource Manager

### Regions
- É uma área geográfica.
- Pode posuir vários datacenters
- A própria Azure faz o balanceamento de resources.

<img src="images/2-regions-large.png" align="center" height=auto width=100%/>

- A Azure é o cloud provider com mais regiões no mundo. Isso provê melhor scalability e  redundancy.
- Não é gerado poluição de carbono e a energia vem de fontes renováveis.
- É o menor grão dos recursos físicos que o usuário pode escolher.

### Avaialibility Zones
- São datacenters separados em uma mesma região.
-  há um mínimo 3 zones dentro de uma única region

<img src="images/4-availability-zones.png" align="center" height=auto width=100%/>

### Resource Group
É um agrupador de resources onde é possível aplicar políticas de acesso.


### Resource Manager (ARM)
É um serviço que faz o deploy e management de resource na Azure.
- Parecido com terraform, chef, ansible

### Service-Level Agreements
Há 3 keys no SLA da Azure:
1. Performance product and services.
2. Uptime and Connectivity Guarantees (99 until 99.999)
3. Service credits. Azure apply discount to as compensation for an under-performing product and services.

### Application availability
- Referece ao tempo global (overral time) que o sistema esta trabalhando.


## Products
  - VM
  - VM scale
  - Service Functions
  - Container Instance
  - Kubernetes Service
  - Virtual Network
  - Load Balancer
  - VPN 
  - Gateway
  - Content Delivery Network
  - Blob Storage
  - Disk Storage
  - File Storage
  - Archive Storage

### VM
VM são as máquinas virtuais linux e windows. Se for produtos como windows server ou sql server, a Azure se torna 5x mais barata que a AWS.

### VM Scale Set
VM scale faz um scaling up ou out automático. Quando a carga de trabalho cai, o próprio serviço se encarrega de excluir as VMs não utilizadas (elatic).

<img src="images/01-deploy.png" align="left" height=auto width=45%/>
<img src="images/02-scale.png" align="right" height=auto width=40%/>


### Virtual Network (Vnet)
É um isolamento lógico da network na Azure decicado a uma subscription.

Advantages
- segurança
- isolamento
- políticas de tráfego

### Application Gateway
**É um load balancer que gerencia o tráfego baseado em URL**.
NOTE: o Azure Load Balancer tambem gerencia o trágefo mas se basea em IP.

###  Content Delivery Network (CDN) 
Uma delivery network de conteúdo é uma rede de servidores que armazena conteúdo de alguma coisa da web em cache para os usuários em sua borda, ou seja, o usuário não precisa ir até o servidor principal para obter o conteúdo, basta acessar a CDN mais próxima (de menor latência).

<img src="images/cdn.png" align="center" height=auto width=100%/>

SQL Database
O servico de SQL database exige que seja configurado um servidor.

Cosmos DB
É schema-less data, idela para dados semi-estruturados (json, por exemplo).

Blob Storage (S3)
É para grande quantidade de dados unstructured.
Easy scaling

Blob Storage (Cold)
Otimizado para dados que são acessado com pouca frequência (30 dias)
**OS custos de armazenamento são mais baixos e custos de acesso mais altos em comparação com o hot tier**.
NOTE: deletion period of 30 days.

Archive Storage (S3 Glacier)
Serve para armazenar dados que rarely são acessados (180 dias). É muito útil para backup e recovery.
NOTE: deletion period of 180 days.


File Storage
Compartilha arquivos via protocolo SMB.

Disk Storage
Serve para storage de disco de VM. Em uma VM é permitido somente 1 disco por vez, então é possível utilizar o Disk Storage para virtualizar outro disco.

Azure Marketplace
É um lugar que apresenta soluções de partners da Azure. É possível dicover ou buy solutions para serem provisionadas na Azure. Ex, VMs personalizadas, databases, developer tools.

Why to use Azure Data Services?
- Automated backup and recovery
- Replication accors the globe
- Support for data analitcs
- Encryption
- Storage tiers


NOTE: deletion period of 30 days.

Tools
<img src="images/azure_tools.png" align="center" height=auto width=100%/>
