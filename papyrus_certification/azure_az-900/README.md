# Study Guide for Azure Certification az-900
![License](https://img.shields.io/badge/Code%20License-MIT-blue.svg)

<img src="images/azure-fundamentals-600x600.png" align="right" height=auto width=15%/>

Montei um guia de estudos com foco na certificação AZ-900 Fundaments da Azure. Os títulos (tópicos) e subtítulos estão em inglês para manter a mesma referência do que é cobrado mas dentro dos tópicos há conteúdo em português e inglês para facilitar a compreensão.


# Summary

**AZ-900: Understand Cloud Concepts (15-20%)**
## Describe the benefits and considerations of using cloud services

* Understand terms such as:
	* [High Availability](https://docs.microsoft.com/en-us/azure/architecture/checklist/availability)
	* Scalability
	* [Elasticity](https://azure.microsoft.com/en-ca/overview/what-is-elastic-computing/)
	* Agility
	* Fault Tolerance
	* [Disaster Recovery](https://docs.microsoft.com/en-ca/azure/site-recovery/site-recovery-overview)
* Understand the Principles of Economies of Scale [(PDF)](http://download.microsoft.com/download/6/e/4/6e4cb3d1-5004-4024-8d90-6c66c83c17aa/the_economics_of_the_cloud_white_paper.pdf)
* Understand the differences between:
	* Capital Expenditure (CapEx)
	* Operational Expenditure (OpEx)
* Understand the consumption-based model

## Describe the differences between Infrastructure-as-a-Service (IaaS), Platform-as-a-Service (PaaS) and Software-as-a-Service (SaaS)

* Describe [Platform-as-a-Service (PaaS)](https://azure.microsoft.com/en-ca/overview/what-is-paas/)
* Describe [Software-as-a-Service (SaaS)](https://azure.microsoft.com/en-ca/overview/what-is-saas/)
* Describe [Infrastructure-as-a-Service (IaaS)](https://azure.microsoft.com/en-ca/overview/what-is-iaas/)
* [Compare and contrast the 3 different service types](https://azure.microsoft.com/en-ca/overview/types-of-cloud-computing/)

## Describe the differences between Public, Private and Hybrid cloud models

* Describe [Public cloud](https://azure.microsoft.com/en-ca/overview/what-is-a-public-cloud/)
* Describe [Private cloud](https://azure.microsoft.com/en-ca/overview/what-is-a-private-cloud/)
* Describe [Hybrid cloud](https://azure.microsoft.com/en-ca/overview/what-is-hybrid-cloud-computing/)
* Compare and contrast the 3 different cloud models

**AZ-900: Understand Core Azure Services (30-35%)**

## Understand the core Azure architectural components

* Describe [Regions](https://azure.microsoft.com/en-ca/global-infrastructure/regions/)
* Describe [Availability Zones](https://docs.microsoft.com/en-us/azure/availability-zones/az-overview)
* Describe [Resource Groups](https://docs.microsoft.com/en-us/azure/architecture/cloud-adoption/getting-started/azure-resource-access#what-is-an-azure-resource-group)
* Describe [Azure Resource Manager](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview)
* Describe the benefits and usage of core Azure architectural components

## Describe some of the core products available in Azure

* Describe products available for Compute such as:
	* [Windows Virtual Machines](https://docs.microsoft.com/en-ca/azure/virtual-machines/windows/overview) | [Linux Virtual Machines](https://docs.microsoft.com/en-ca/azure/virtual-machines/linux/overview)
	* [Virtual Machine Scale Sets](https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview)
	* [App Service](https://docs.microsoft.com/en-us/azure/app-service/)
	* [Azure Functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview)
	* Azure Container Instsances (ACI)
	* Azure Kubernetes Service (AKS)
* Describe products available for Networking such as:
	* [Virtual Network](https://docs.microsoft.com/en-us/azure/virtual-network/virtual-networks-overview)
	* [Load Balancer](https://docs.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)
	* [VPN Gateway](https://docs.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways)
	* [Application Gateway](https://docs.microsoft.com/en-us/azure/application-gateway/overview)
	* [Content Delivery Network](https://docs.microsoft.com/en-us/azure/cdn/cdn-overview)
* Describe products available for Storage such as:
	* [Blob Storage](https://docs.microsoft.com/en-us/azure/storage/blobs/storage-blobs-overview)
	* [Disk Storage](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/managed-disks-overview)
	* [File Storage](https://docs.microsoft.com/en-us/azure/storage/files/storage-files-introduction)
	* [Archive Storage](https://docs.microsoft.com/en-ca/azure/storage/blobs/storage-blob-storage-tiers)
* Describe products available for Databases such as:
	* [Azure Cosmos DB](https://docs.microsoft.com/en-us/azure/cosmos-db/introduction)
	* [Azure SQL Database](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-technical-overview)
	* Azure Databsae for MySQL
	* Azure Database for PostgreSQL
	* [Azure Database Migration Service (DMS)](https://docs.microsoft.com/en-us/azure/dms/dms-overview)
	* [Azure Synapse Analytics (formerly SQL DW)](https://docs.microsoft.com/en-ca/azure/sql-data-warehouse/sql-data-warehouse-overview-what-is)
* Describe the [Azure Marketplace and its usage scenarios](https://azuremarketplace.microsoft.com/en-us/about)

## Describe some of the solutions available on Azure

* Describe [Internet of Things (IoT) and products](https://docs.microsoft.com/en-us/azure/iot-fundamentals/iot-services-and-technologies) that are available for IoT on Azure such as:
	* [IoT Fundamentals](https://docs.microsoft.com/bs-cyrl-ba/azure/iot-fundamentals/index)
	* [IoT Hub](https://docs.microsoft.com/en-ca/azure/iot-hub/about-iot-hub)
	* [IoT Central](https://docs.microsoft.com/en-ca/azure/iot-central/overview-iot-central)
* Describe Big Data and Analytics and products that are available for Big Data and Analytics such as:
	* [Azure Synapse Analytics (formerly SQL DW)](https://docs.microsoft.com/en-ca/azure/sql-data-warehouse/sql-data-warehouse-overview-what-is)
	* [HDInsight](https://docs.microsoft.com/en-ca/azure/hdinsight/)
	* [Azure Databricks](https://docs.microsoft.com/en-us/azure/azure-databricks/what-is-azure-databricks)
* Describe Artificial Intelligence (AI) and products that are available for AI such as:
	* [Azure Machine Learning Service](https://azure.microsoft.com/en-ca/services/machine-learning-service/)
	* [Azure Machine Learning Studio](https://azure.microsoft.com/en-ca/services/machine-learning-studio/) | [https://studio.azureml.net/](https://studio.azureml.net/)
* Describe Serverless computing and Azure products that are available for serverless computing such as:
	* [Azure Functions](https://docs.microsoft.com/en-us/azure/azure-functions/functions-overview)
	* [Logic Apps](https://docs.microsoft.com/en-ca/azure/logic-apps/logic-apps-overview)
	* Event grid
* Describe the benefits and outcomes of using Azure solutions

## Understand Azure management tools

* Understand Azure tools such as:
	* [Azure Portal](https://docs.microsoft.com/en-us/azure/azure-portal/azure-portal-overview)
	* [Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/overview?view=azps-1.6.0)
	* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
	* [Azure Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview)

* Understand [Azure Advisor](https://docs.microsoft.com/en-us/azure/advisor/advisor-overview)


**AZ-900: Understand Security, Privacy, Compliance, and Trust (25-30%)**

## Understand securing network connectivity in Azure

* Describe [Network Security Groups (NSG)](https://docs.microsoft.com/en-us/azure/virtual-network/security-overview)
* Describe [Application Security Groups (ASG)](https://docs.microsoft.com/en-us/azure/virtual-network/security-overview#application-security-groups)
* Describe User Defined Rules (UDR)
* Describe [Azure Firewall](https://docs.microsoft.com/en-us/azure/firewall/overview)
* Describe [Azure DDoS Protection](https://docs.microsoft.com/en-us/azure/virtual-network/ddos-protection-overview)
* Choose an appropriate Azure security solution

## Describe core Azure Identity services

* Understand the difference between [Authentication and Authorization](https://docs.microsoft.com/en-us/azure/app-service/overview-authentication-authorization)
* Describe [Azure Active Directory](https://docs.microsoft.com/en-ca/azure/active-directory/fundamentals/active-directory-whatis)
* Describe [Azure Multi-Factor Authentication](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks)

## Describe security tools and features of Azure

* Describe [Azure Security Center](https://docs.microsoft.com/en-us/azure/security/azure-security)
* Understand [Azure Security Center](https://docs.microsoft.com/en-ca/azure/security-center/security-center-intro) usage scenarios
* Describe [Key Vault](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-whatis)
* Describe [Azure Information Protection (AIP)](https://docs.microsoft.com/en-us/azure/information-protection/what-is-information-protection)
* Describe [Azure Advanced Threat Protection (ATP)](https://docs.microsoft.com/en-us/azure-advanced-threat-protection/what-is-atp)

## Describe Azure governance methodologies

* Describe policies and initiatives with [Azure Policy](https://docs.microsoft.com/en-us/azure/governance/policy/overview)
* Describe [Role-Based Access Control (RBAC)](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview)
* Describe [Locks](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-lock-resources)
* Describe [Azure Advisor](https://docs.microsoft.com/en-us/azure/advisor/advisor-overview) security assistance
* Describe [Azure Blueprints](https://docs.microsoft.com/en-us/azure/governance/blueprints/overview)

## Understand monitoring and reporting options in Azure

* Describe [Azure Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/overview)
* Describe [Azure Service Health](https://docs.microsoft.com/en-ca/azure/service-health/)
* Understand the use cases and benefits of:
    * Azure Monitor
    * Azure Service Health

## Understand privacy, compliance and data protection standards in Azure

* Understand industry compliance terms such as:
    * [GDPR](https://www.microsoft.com/en-us/trustcenter/privacy/gdpr/gdpr-overview) | [More info](https://docs.microsoft.com/en-us/office365/securitycompliance/manage-gdpr-data-subject-requests-with-the-dsr-case-tool)
    * [ISO](https://www.microsoft.com/en-us/TrustCenter/Compliance/iso-iec-27018)
    * [NIST](https://www.microsoft.com/en-us/trustcenter/compliance/NIST_CSF)
* Understand the [Microsoft Privacy Statement](https://privacy.microsoft.com/en-ca/privacystatement)
* Describe the [Trust Center](https://www.microsoft.com/en-us/trustcenter/cloudservices/azure)
* Describe the [Service Trust Portal](https://servicetrust.microsoft.com/) | [Getting Started](https://docs.microsoft.com/en-us/office365/securitycompliance/get-started-with-service-trust-portal)
* Describe [Compliance Manager](/)
* Determine if Azure is compliant for a business need
* Understand [Azure Government cloud services](https://docs.microsoft.com/en-us/azure/azure-government/documentation-government-welcome)
* Describe Azure China cloud services

**AZ-900: Understand Azure Pricing and Support (20-25%)**

## Understand Azure Subscriptions

* Describe an [Azure Subscription](https://docs.microsoft.com/en-us/azure/architecture/cloud-adoption/getting-started/azure-resource-access#what-is-an-azure-subscription)
* Understand the uses and options with Azure Subscriptions such as:
    * Access Control
    * Offer Types
* Understand subscription management using Management Groups

## Understand planning and management of costs

* Understand options for purchasing Azure products and services
* Understand options around [Azure Free account](https://azure.microsoft.com/en-ca/free/free-account-faq/)
* Understand the factors affecting costs such as:
    * Resource Types
    * Services
    * Locations
    * Ingress traffic
    * Egress traffic
* Understand Zones for billing purposes
* Understand the [Pricing calculator](https://azure.microsoft.com/en-ca/pricing/calculator/)
* Understand the [Total Cost of Ownership (TCO) calculator](https://azure.microsoft.com/en-ca/pricing/tco/)
* Understand [best practices for minimizing Azure costs](https://docs.microsoft.com/en-us/azure/billing/billing-getting-started) such as:
    * Performing [Cost Analysis](https://docs.microsoft.com/en-us/azure/cost-management/quick-acm-cost-analysis)
    * Creating [spending limits](https://docs.microsoft.com/en-us/azure/billing/billing-spending-limit) and [quotas](https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits)
    * [Using tags to identify cost owners](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-using-tags)
    * Using [Azure reservations](https://azure.microsoft.com/en-ca/reservations/)
    * Using [Azure Advisor recommendations](https://docs.microsoft.com/en-ca/azure/advisor/advisor-overview)
* Describe [Azure Cost Management](https://docs.microsoft.com/en-us/azure/cost-management/overview-cost-mgt)

## Understand the support options available with Azure

* Understand [support plans](https://azure.microsoft.com/en-ca/support/plans/) that are available such as:
    * [Developer](https://azure.microsoft.com/en-ca/support/plans/developer/)
    * [Standard](https://azure.microsoft.com/en-ca/support/plans/standard/)
    * [Professional Direct (ProDirect)](https://azure.microsoft.com/en-ca/support/plans/prodirect/)
    * [Premier](https://azure.microsoft.com/en-ca/support/plans/premier/)
* Understand [how to open a support ticket](https://azure.microsoft.com/en-ca/support/create-ticket/)
* Understand [available support channels outside of support plan channels](https://azure.microsoft.com/en-ca/support/faq/)
* Describe the [Knowledge Center](https://azure.microsoft.com/en-us/resources/knowledge-center/)

## Describe Azure Service Level Agreements (SLAs)

* Describe a [Service Level Agreement (SLA)](https://azure.microsoft.com/en-ca/support/legal/sla/)
* Understand Composite SLAs
* Understand how to determine an appropriate SLA for an application

## Understand service lifecycle in Azure

* Understand Public Preview features
* Understand [Private Preview features](https://azure.microsoft.com/en-ca/support/legal/preview-supplemental-terms/)
* Understand the term General Availability (GA)
    * GA means a service is in production and can be used by anyone with an Azure subscription
* Understand how to [monitor feature updates and product changes](https://azure.microsoft.com/en-ca/updates/)

## Uselful Links
- Simulates
        - https://www.udemy.com/course/simulado-certificacao-az-900/
        - https://www.udemy.com/course/simulado-para-a-prova-az-900/
- Tranning
        - https://www.udemy.com/course/introducao-ao-microsoft-azure-certificacao-az-900/
        - https://www.udemy.com/course/microsoft-azure-beginners-guide/
        - https://docs.microsoft.com/en-us/learn/paths/azure-fundamentals/
        - https://github.com/AzureMentor/Azure-AZ-900-Study-Guide
- Link for Test
        - https://wsr.pearsonvue.com/testtaker/registration/Dashboard/MICROSOFT
- How the test works ?
        - https://www.youtube.com/watch?v=Vb0OGIH-2MM&list=PLahhVEj9XNTceGnF19qSjYxYzS4S_Wlmf&index=2&t=0s
        - https://www.youtube.com/watch?v=k9qDZ4gnjtA
- English Trainning
        - https://www.udemy.com/course/curso-de-ingles-para-ti/

## Schedule
- Sunday: overview
- Monday: Understand core Azure services (35%)
- Tuesday: Understand core Azure services (35%)
- Wednesday: Understand security, privacy, compliance, and trust (30%)
- Thursday: Understand security, privacy, compliance, and trust (30%)
- Friday: Understand Azure Pricing and Support (25%)
- Saturday: Review

Appointment
Saturday, 2020
Start Time: 19:00 BRT

Exam
AZ-900: Microsoft Azure Fundamentals
Language: English
Exam Length: 90 minutes

<img src="images/3c-capexvsopex.png" align="center" height=auto width=100%/>


- Microsoft Policies
```
System Requirements
ALERT: Before you register for an online proctored exam, review the system requirements, check the list of participating countries, read about the testing protocols, and complete the required system test: Online Proctoring Required Information
Admission Policy
PLEASE NOTE THIS EXAM IS PROCTORED IN ENGLISH ONLY. THERE IS NOT AN OPTION FOR LOCAL LANGUAGE PROCTORING AT THIS TIME.

PERFORM A SYSTEM TEST (Prior to Exam Day):
Please follow this link to perform a SYSTEM TEST from the same computer and location you will be testing from on exam day: http://www.pearsonvue.com/microsoft/op. Ensure you have administrative rights on your computer to be able to download the software.

If your system does not meet the requirements please register to take the exam at a testing center. If your computer is found not to meet requirements on the exam day you are unlikely to receive a refund.

REVIEW EXAM INFORMATION (Prior to Exam Day):
Please follow this link http://www.pearsonvue.com/microsoft/op to find information on:

Exam policies
System requirements
Admission steps.

REVIEW ID POLICIES (Prior to Exam Day):
Please be prepared to show one (1) valid form of unexpired, Government issued personal ID.
The Government issued ID must have your signature and must have your photo.
The name on the registration must match the names on the Government issued ID exactly.

Please note that we are unable to accept the following ID’s for an online proctored exam.
Renewal forms with expired ID’s
Government Issued name change documents with Government ID.

START YOUR EXAM (Exam Day):
Login: START YOUR EXAM (Exam Day):
Login: www.microsoft.com/learning
Click “Dashboard” to view your appointments, and then choose “Start a previously scheduled online proctored exam.”
Click on your exam under 'Purchased Online Exams'
Click “Begin” and proceed through the self check-in process and wait for a Proctor to connect with you

We recommend logging in 15 minutes early to start the check-in process. YOU WILL ONLY HAVE up to 15 minutes after your scheduled appointment time to begin the exam process.
This exam admission process also includes the following Enhanced Security Protocol admission steps: Digital Photograph

You will not be allowed to have any personal items with you in your testing environment. This includes all bags, books not authorized by the testing program, notes, pagers, and watches. Please note you are required to have a clean and clutter free workstation. During check-in, the Greeter will ask you to scan the room and will inspect any materials near your workstation.

Facial Comparison Policy

You understand and agree that Pearson VUE may use facial comparison technology for the purpose of verifying your identity during the testing process. It will compare your facial image to the one on your identification and to facial images captured during the testing process and help us further develop, upgrade, and improve this application. If you do not agree to the use of facial comparison technology during your testing session, do not accept this term. You will not be able to complete your registration online. Instead, please call the Pearson VUE call center to complete your registration.

Reschedule Policy
There is no charge if you reschedule an exam appointment at least 6 business days prior to your appointment. There is a fee of 12.5% (based on the current Microsoft exam price as published on Microsoft.com/learning) for rescheduling your appointment 5 business days or less before your exam date. If you fail to show up for your exam appointment (no-show) or dont reschedule your appointment at least 24 hours prior to your scheduled appointment, you forfeit your entire exam fee. Business days are Monday-Friday, not including holidays.
You may reschedule your appointment by calling the Pearson VUE call center, contacting the test center where your appointment is scheduled, or accessing the Microsoft Learning website and choosing the reschedule action. If you registered with accommodations, you must reschedule through the call center.

Cancellation Policy
There is no charge if you cancel an exam appointment at least 6 business days prior to your appointment. There is a fee of 12.5% (based on the current Microsoft exam price as published on Microsoft.com/learning) for cancelling your appointment 5 business days or less before your exam date.
If you fail to show up for your exam appointment (no-show) or dont cancel your appointment at least 24 hours prior to your scheduled appointment, you forfeit your entire exam fee. Business days are Monday-Friday, not including holidays.
You may cancel your appointment by calling the Pearson VUE call center, contacting the test center where your appointment is scheduled, or accessing the Microsoft Learning website and choosing the reschedule action. If you registered with accommodations, you must cancel through the call center.
```
---
---

# **Resume**
## AZ-900: Understand Cloud Concepts (20%)

### Cloud Concept
- Scalability
  - scaling up: vertical
  - caling out: horizontal
  - _can expand its size when there are more users in the system_

- Elasticity
  - _can shrink its size when there are fewer users in the system_
  - _can also set automatic shutdown during the non-business hours to save money_

### [Capital expenditure (CapEx) versus operational expenditure (OpEx)](https://docs.microsoft.com/en-us/learn/modules/principles-cloud-computing/3c-capex-vs-opex)
O Capital expenditure garante custos fixos para compras a longo prazo. Isto torna a melhor escolha quando o budget é limitado.
- CapEx computing costs
 - Server
 - Storage
 - Network
 - Backup
 - disaster recovery
 
O operational expenditure são custos de curto prazo.
- _OpEx cloud computing costs_
  - _Leasing software_
  - _usage/demand instead of fixed hardware_
  - _Billing at the user or organization level_

Quando não se sabe a demanda e _growth_ a melhor escolha é o OpEx

<img src="images/3c-capexvsopex.png" align="center" height=auto width=100%/>


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

Question: You are running a virtual machine in a public cloud using IaaS. Which model correctly reflects how that resource is managed?
<br/>
shared responsibility: The cloud provider being responsible for the cloud services infrastructure and the end user being responsible for the service being configured and managed correctly.


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
---

## Understand core Azure services (35%)
### Architectural
  - [Regions](#regions)
  - [Avaialibility Zones](#avaialibility-zones)
  - [Resource Groups](#resource-groups)
  - [Azure Resource Manager](#azure-resource-manager)

#### Regions
- É uma área geográfica.
- Pode posuir vários datacenters
- A própria Azure faz o balanceamento de resources.

<img src="images/2-regions-large.png" align="center" height=auto width=100%/>

- A Azure é o cloud provider com mais regions no mundo. Isso provê melhor scalability e  redundancy.
- Não é gerado poluição de carbono e a energia vem de fontes renováveis.
- É o menor grão dos recursos físicos que o usuário pode escolher.

#### Avaialibility Zones
- São datacenters separados em uma mesma region.
- Há um mínimo 3 zones dentro de uma única region

<img src="images/4-availability-zones.png" align="center" height=auto width=70%/>

<br/>

#### Resource Groups
<img src="images/resourcegroup_color.png" align="right" height=auto width=10%/>

É um agrupador lógico de _resources_ onde é possível aplicar políticas de acesso.

#### Azure Resource Manager
- É um serviço que faz o _deploy_ e _management_ de resource na Azure.
- Parecido com chef, ansible (não tem estado)

<br/>
<br/>
<br/>

### Describe some of the core products available in Azure
 - Environments
   - [VM](#vm)
   - [VM scale set](#vm-scale-set)
   - [Azure Functions](#azure-functions)
   - [Logic Apps](#logic-apps)
   - [Container Instance](#container-instance)
   - [Kubernetes Service](#kubernets-services)
 - Network
   - [Virtual Network](#)
   - [Load Balancer](#)
   - [VPN Gateway](#)
   - [Application Gateway](#)
   - [Content Delivery Network](#)
 - Storage
   - [Blob Storage](#)
   - [Disk Storage](#)
   - [File Storage](#)
   - [Archive Storage](#)
 - [Azure Marketplace](#)


#### Azure Functions
- É um recurso que permite executar _call_ de funções a partir de uma trigger.
- _Serverless applications_

#### Logic Apps
- É um serviço de nuvem que ajuda a agendar, automatizar e orquestrar tarefas, processos de negócios e fluxos de trabalho quando você precisar integrar aplicativos, dados, sistemas e serviços em empresas ou organizações. 
- Não precisa se preocupar em criar, hospedar, dimensionar, gerenciar, manter e monitorar seus aplicativos. O Logic Apps lida com essas preocupações para você. Além disso, você paga apenas pelo que usa com base em um modelo de preços de consumo .
- _Logic Apps allow developers to design workflows that articulate intent via a trigger and series of steps_

<img src="images/logic_app.png" align="center" height=auto width=80%/>

#### VM
VM são as máquinas virtuais linux e windows. Se for produtos como windows server ou sql server, a Azure se torna 5x mais barata que a AWS.

#### VM Scale Set
VM scale faz um scaling up ou scaling out automático. Quando a carga de trabalho cai, o próprio serviço se encarrega de excluir as VMs não utilizadas (_elatic_).

<img src="images/01-deploy.png" align="left" height=auto width=45%/>
<img src="images/02-scale.png" align="center" height=auto width=40%/>

<br/>

#### Load Balancer
É um serviço de distribuição de carga.

<img src="images/load_balancer.png" align="center" height=auto width=80%/>

<br/>

#### Virtual Network
- É um isolamento lógico de _network_ na Azure no escopo de uma [regions](#regions).

<img src="images/vnet.png" align="center" height=auto width=90%/>

- Permite definir os private IPs. Tambem é possível criar VNets com o mesmo espaço de endereço em duas regiões diferentes (por exemplo, Leste dos EUA e Oeste dos EUA)
- É possível vincular uma vnet a uma rede local por meio de um gateway VPN.
- _Network Interfaces don't add any cost to company_

<img src="images/D0mh7tjXgAElwyP.png" align="center" height=auto width=100%/>

- Advantages
  - segurança
  - isolamento
  - políticas de tráfego
- _Secure your VNet using Network Security Groups (NSGs)_


**Question: You plan to deploy 20 virtual machines to an Azure environment. To ensure that a virtual machine named VM1 cannot connect to the other virtual machines, VM1 must _be deployed to a separate virtual network_**

**Question: You have an Azure environment that contains 10 virtual networks and 100 virtual machines.You need to limit the amount of inbound traffic to all the Azure virtual networks.**


**Question**
<br/>
The companyâ€™s compliance policy states that a server named FinServer must be on a separate network segment.
You are evaluating which Azure services can be used to meet the compliance policy requirements.
Which Azure solution should you recommend?



#### Application Gateway
**É um load balancer que gerencia o tráfego baseado em rota (URL)**.

NOTE: o Azure Load Balancer tambem gerencia o trágefo mas se basea em IP.

<img src="images/app_gateway.png" align="center" height=auto width=100%/>

<br/>

#### VPN Gateway
- É um tunelamento de um _virtual network_ que encripta o tráfego entre a cloud e o ambiente local.
- A VPN gateway is a specific type of virtual network gateway that is used to send encrypted traffic between an Azure virtual network and an on-premises location 
- Each virtual network can have only one VPN gateway

<img src="images/vpn_gateway.png" align="center" height=auto width=100%/>

#### Content Delivery Network (CDN) 
Uma _delivery network_ de conteúdo é uma rede de servidores que armazena conteúdo de alguma coisa da web em cache para os usuários em sua borda, ou seja, o usuário não precisa ir até o servidor principal para obter o conteúdo, basta acessar a CDN mais próxima (de menor latência).

<img src="images/cdn.png" align="center" height=auto width=100%/>

#### SQL Database
O servico de SQL database exige que seja configurado um servidor.

#### Cosmos DB
É schema-less data, ideal para dados semi-estruturados (json, por exemplo).

#### Blob Storage 'S3'
É para grande quantidade de dados unstructured.

#### Blob Storage Cold 'S3 Glacier'
- Otimizado para dados que são acessado com pouca frequência (30 dias)
- **OS custos de armazenamento são mais baixos e custos de acesso mais altos em comparação com o hot tier**.
- NOTE: deletion period of 30 days.

#### Archive Storage 'S3 Glacier'
- Serve para armazenar dados que rarely são acessados (180 dias). É muito útil para backup e recovery.
- NOTE: deletion period of 180 days.

#### File Storage
Compartilha arquivos via **protocolo SMB**

#### Disk Storage
Serve para storage de disco de VM. Em uma VM é permitido somente 1 disco por vez, então é possível utilizar o Disk Storage para virtualizar outro disco.

#### Azure Marketplace
É um lugar que apresenta soluções de _partners_ da Azure. É possível decobrir e comprar soluções para serem provisionadas na Azure. Ex, VMs personalizadas, databases, developer tools.

#### Why to use Azure Data Services?
- Automated backup and recovery
- Replication accors the globe
- Support for data analytcs
- Encryption
- Storage tiers

## Tools
<img src="images/azure_tools.png" align="center" height=auto width=90%/>

<br/>

**Azure Dashboard**: can be exported `json`

---
---
## Understand security, privacy, compliance, and trust (30%)

### Azure Securing Network
- [Network Security Groups (NSG)](#network-security-groups-(NSG))
- [Application Security Groups (ASG)](#application-security-groups-(ASG))
- [User Defined Rules (UDR)](#)
- [Azure Firewall](#)
- [Azure DDoS Protection](#)
- [Choose an appropriate Azure security solution](#)

#### Network Security Groups (NSG)
- AWS = VPC
- O Network Security Group (NSG) é a principal ferramenta para gerenciar e controlar as regras de tráfego de rede. 
- _A security group acts as a virtual firewall_ 
- _This services filter network traffic_
- **contains a list of security roles** about control inbound and outbound network traffic. Network Security Groups can be associated to subnets, VM and NICs.


- It can contain multiple inbound and outbound security rules that enable you to filter traffic to and from resources by source and destination IP address, port, and protocol

<img src="images/security_group.jpg" align="center" height=auto width=100%/>

**Question**
<br/>
You want to filter inbound and outbound network traffic to and from Azure resources in your Azure virtual network. Which Azure service should you use?

<br/>

#### Application Security Groups (ASG)
- Ajuda a gerenciar a segurança de máquinas virtuais agrupando-os de acordo com os aplicativos executados neles.
- Os ASGs são usados ​​dentro de um NSG para aplicar uma regra de segurança de rede.
- _Application Security Groups enable you to configure network security as a natural extension of an application_
- Not need explict IP address

<img src="images/application-security-groups.png" align="center" height=auto width=100%/>

<img src="images/application-security-groups_doc.png" align="center" height=auto width=100%/>

<br/>

#### Azure Firewall
- _Network Security Group and Application Security Group not match pattern our identify traffic_
- É um firewall totalmente stateful como um serviço com alta disponibilidade incorporada e escalabilidade irrestrita na nuvem.

<img src="images/firewall-threat.png" align="center" height=auto width=100%/>

- Azure Firewall will control access in and out of your network but will not control inbound and outbound

- Integrated with Azure Monitor for logging and analytics.




















#### Azure DDos Protection
- Distributed denial of service
- A DDoS attack attempts to exhaust an application’s resources, making the application unavailable to legitimate users. 
- Os ataques DDoS podem ser direcionados para qualquer terminal acessível publicamente pela Internet.
- Azure DDoS protection, combined with application design best practices, provide defense against DDoS attacks.
- Atua na camada de aplicação 

<img src="images/ddos_protection.png" align="center" height=auto width=100%/>
- Nesta arquitetura, o DDoS Protection Standard está ativado na rede virtual.

**Question**
<br/>
There has been an attack on your public-facing website, and the application's resources have been overwhelmed and exhausted, and are now unavailable to users. What service should you use to prevent this type of attack?



<br/>

#### Service Trust
- É um portal fornece uma variedade de conteúdo, ferramentas e outros recursos sobre práticas de segurança, privacidade 
- Portal: https://www.microsoft.com/pt-br/trust-center?rtc=1


## Identity and Access Management (IAM)
- [Understand the difference between authentication and authorization](#)
- [Azure Active Directory](#)
- [Azure Multi-Factor Authentication](#)

#### Understand the difference between authentication and authorization
**Authentication**: Authentication is the process of **estabilishing the identity** of a person or service loking to access a resource.

**Authorization**: Authorization is the process of estabilishing what **level of access** an authenticated person or service has.

#### **Azure Active Directory**
- O [Azure Active Directory](https://azure.microsoft.com/en-us/services/active-directory/) é um serviço que fornece gerenciamento de identidade e acesso para ambientes de nuvem híbrida.

<img src="images/activity-directory-hydrid-cloud.png" align="center" height=auto width=100%/>


- O [Azure Active Directory B2C](https://azure.microsoft.com/en-us/services/active-directory-b2c/) gerencia e protege as identidades dos clientes e o acesso na nuvem usando IAM security features.


<img src="images/azure_ad_b2c.png" align="center" height=auto width=100%/>


O Azure Active Directory (Azure AD) é o serviço de gerenciamento de identidade e acesso baseado em nuvem da Microsoft, como:
- Office 365
- Aplicativos em sua rede corporativa e intranet da própria organização.

**Features**
<br/>
- Authentication
- Access management
- Application management
- SSO
- B2C identity services
- B2B identity services
- Device manager

**Who uses Azure AD?**
<br/>
As an IT admin, you can use Azure AD to control access to your apps and your app resources, based on your business requirements. For example, you can use Azure AD to require multi-factor authentication when accessing important organizational resources. Additionally, you can use Azure AD to automate user provisioning between your existing Windows Server AD and your cloud apps, including Office 365. 

As an app developer, you can use Azure AD as a standards-based approach for adding single sign-on (SSO) to your app, allowing it to work with a user's pre-existing credentials. 


**AD licenses**
- _The unused user accounts don't add any cost to the company_
- Office 365 ou o Microsoft Azure usam Azure AD.
- As licenças pagas do Azure AD são criadas sobre o diretório gratuito existente, fornecendo autoatendimento, monitoramento aprimorado, relatórios de segurança e acesso seguro aos usuários móveis.
- **Azure Active Directory Free**. Provides user and group management, on-premises directory synchronization, basic reports, self-service password change for cloud users, and single sign-on across Azure, Office 365, and many popular SaaS apps.



## Security Tools and Features of Azure
**Azure Security Center**

<img src="images/compute.png" align="center" height=auto width=100%/>

<br/>

<img src="images/sc-net-map.png" align="center" height=auto width=100%/>

- Is a monitoring service that provides threat protection across all of your services in Azure and on-premises. 
- Use machine learning to deteck and block malwares
- Azure Security Center is a unified infrastructure security management system 

<img src="images/overview_security_center.png" align="center" height=auto width=100%/>

- Can do:
  - provide recommendations based on configurations, resources and network
  - monitor security settings 

- Usage scenarios
 - For incident response
 - Recommendations fo enhance security (melhorar a segurança)

#### Advanced Threat Protection
Cloud-based that identifies, detects and helps investigate to 
 - advanced threats (ameaças)
 - compromised identities
 - malicious insider actions (ações maliciosas)

Advanced
- Monitor profile user how activities and behavior
- Identify suspicious activities
- Protect user identities and reduce the attack surface

#### Azure Information Protection**
Help organizations classify and protect documents and email with labels.

<img src="images/info-protect-recommend-calloutsv2.png" align="center" height=auto width=100%/>


**Question**: 
<br/>
_________ is a cloud-based solution that helps an organization to classify and optionally, protect its documents and emails by applying labels.



## Azure Security Tools
- Azure Security Center
- Key Vault
- Azure Information Protection (AIP)
- Azure Advanced Threat Protection (ATP)

## Azure Governance
 describe policies and initiatives with Azure Policy
• describe Role-Based Access Control (RBAC)
• describe Locks
• describe Azure Advisor security assistance
• describe Azure Blueprints

## Azure Monitoring and Reporting Options
- Azure Monitor
- Azure Service Health
- Understand the use cases and benefits of Azure Monitor and Azure Service Health


### Understand monitoring and reporting options in Azure

#### Azure Monitor and Azure Service Health**
Azure Monitor monitora, analisa dados e execução ações encima de alertas criados. Já o Azure Service Health mostra a saúde da Azure onde é possível ver as manutenções preventivas e se há algum incidente.

### Azure governance methodologies
São ferramentas que a Azure tem para gerenciar subscriptions.
- Azure policy
- Role-based access control
- Lock
- Blueprints (conjuntos repetitíveis de recursos)

#### Azure policy
Allow create, assing and manage polices over resources.


#### Role-based access control**
Controla o nível de autorização por usuário.

#### Locks
- Lock resources to prevent unexpected changes
- É um serviço para que quando um usuário tenha acesso a um recurso só possa executar algumas funções.
- Ajuda a previnir exclusão acidental (canNotDelete) ou limitar a somente leitura (readOnly) algum usuário.

<img src="images/set-lock.png" align="center" height=auto width=100%/>

<img src="images/delete-lock.png" align="center" height=auto width=100%/>

**Question**
<br/>
To avoid accidental deletion of a resource, we can use _____

**Question**
<br/>
Which of the following would be good to put a resource lock on?

_You want to put a lock on something that is important/critical for you/your application._

**Question**
<br/>
When you apply a lock at a parent scope, all resources within that scope inherit the same lock. 
**True**


#### [Azure Blueprints](https://docs.microsoft.com/en-us/azure/governance/blueprints/overview)**
- É um RM que guarda estado.
- define a repeatable set of Azure resources
- O serviço foi projetado para ajudar na configuração do ambiente . - Essa configuração geralmente consiste em um conjunto de grupos de recursos, políticas, atribuições de função e implantações de modelo do Resource Manager.

- É uma forma declarativa de orquestrar a implatação de recursos que segue a ordem:
1. Role assignment
2. Policy assignment 
3. ARM template 

-  different from Resource Manager templates: RM é um documento que não existe nativamente no Azure não há conexão ou relacionamento ativo com a modelagem feita, ou seja, não guarda estado.
Com o Blueprints, o relacionamento entre a definição do blueprint (o que deve ser implantado) e a atribuição do blueprint (o que foi implantado) é preservado.


---

## Understand Azure pricing and support (20-25%)

#### Azure Subscritpions**
- Is a logical container used to provision resource.
- Azure subscription is associated with Azure AD.

#### Subscription Types
- Free
  - $ 200 for 30 day
  - started with 12 months of free services
- Student
  - $ 100 for 12 months
- Pay-as-you-go
- Enterprise Agreement: ideal para empresas que contratam serviços em nuvem e licenças de software, como office, sob um único contrato, o que garante descontos.


**Question**
<br/>
Your Azure trial account expired last week. You are now unable to ________
<br/>
_access the azure portal_

#### [Management Groups](https://docs.microsoft.com/en-us/azure/governance/management-groups/overview)
These groups are containers that help you manage access, policy, and compliance for multiple subscriptions.

- Ex: You can create a hierarchy that applies a policy, for example, which limits VM locations to the US West Region

<img src="images/tree.png" align="center" height=auto width=100%/>

#### [Object Hierarchy](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-setup-guide/organize-resources?tabs=AzureManagmentGroupsAndHierarchy)**

<img src="images/scope-levels.png" align="center" height=auto width=100%/>

#### [Azure Support Options](https://azure.microsoft.com/en-us/support/plans/)

Features
- Para abrir um _new support request_ são aceitos os seguintes planos:
  - Premier
  - Professional
  - Standard
  - Developer
- Para ter suporte com um desenvolvedor da Azure é necessário pagar o suporte **premier**
- o suporte **developer** não esta disponível para empresas 

<img src="images/azure_suport.png" align="center" height=auto width=100%/>


**Question**
<br/>
Your company plans to purchase Azure.The companyâ€™s support policy states that the Azure environment must provide an option to access support engineers by phone or email. You need to recommend which support plan meets the support policy requirement.

#### Knowledge Center
- 'stackoverflow' da azure
- É um banco de dados que contém perguntas e repostas da comunidade.

#### How to open a support ticket
<img src="images/suport_help.png" align="center" height=auto width=100%/>

#### SLA
- O sla expecifica o que acontece se um serviço falhar. Por exemplo, em caso de falhas o cliente pode ganhar descontos (service credits)
- sla geral da Azure: 99,9%

<img src="images/calulate_sla.png" align="center" height=auto width=100%/>


#### Service-Level Agreements
Há 3 keys no SLA da Azure:
1. Performance product and services.
2. Uptime and Connectivity Guarantees (99 until 99.999)
3. Service credits. Azure apply discount to as compensation for an under-performing product and services.

#### Application availability
- Referese ao tempo global (overral time) que o sistema esta trabalhando.

**Question**
<br/>
As you increase availability, you also increase the cost and complexity of your solution?

_Availability refers to the proportion of time that a system is functional and working. Maximizing availability requires implementing measures to prevent possible service failures_

---

## Author
- Bruno Aurélio Rôzza de Moura Campos (brunocampos01@gmail.com)

## Copyright
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Bruno A. R. M. Campos</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.
