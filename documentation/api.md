# API Rest

## Conceitos iniciais

* **Recursos** são as entidades de negócio do domínio de negócio, por exemplo: documentos, usuários, processos.
* São acessados por meio de um identificador formato URI, por exemplo: `/documentos`, `/usuarios`, `/processos`.
* Podem ser obtidos como uma instância ou como uma coleção, por exemplo: `/documentos/1`, `/documentos`; `/usuarios/joao`, `/usuarios`; `/processos/2018`.
* Já os **métodos** definem a operação que deve ser realizada, por exemplo: `GET /usuarios` para consulta, `DELETE /usuarios/joao` para remoção.

### Benefícios

* Consistência com outras API publicadas pela mesma unidade organizacional ou organização.
* Facilidade de entendimento, de aprendizado e de uso por utilizar recomendações de mercado.

### Nomenclatura

A identificação de recursos no REST é feita através do conceito de [URI](https://www.w3.org/Addressing/URL/uri-spec.html), que é um padrão utilizado na Web. Exemplos:

* http://www.empresa.com.br/gestao-processos/v1/processos
* http://www.empresa.com.br/gestao-processos/v1/situacoes

#### Rotas (spinal-case)

Ao definir uma rota, utilize nomes legíveis por humanos, que sejam de fácil interpretação e que tenham vinculo com o domínio da aplicação.

* Utilize os nomes de recurso no plural, seja instância ou coleção [^5].;
    * `www.empresa.com.br/gestao-processos/v1/processos` e não `www.empresa.com.br/gestao-processos/v1/processo`
* [Utilize  letras minúsculas e traço/hífen (`-`) para separar palavras em segmentos do caminho do serviço](https://opensource.zalando.com/restful-api-guidelines/index.html#129);
    * `www.empresa.com.br/gestao-processos` e não `www.empresa.com.br/gestaoProcessos`
* [Utilize substantivos e não verbos](https://blog.apigee.com/detail/restful_api_design_nouns_are_good_verbs_are_bad)
    * `www.empresa.com.br/gestao-processos/v1/processos` e não `www.empresa.com.br/gestao-processos/v1/processos/cadastrar`
* Utilize sub-recursos para lidar com relacionamentos que só devem existir dentro de outro recurso;
    * `www.empresa.com.br/gestao-processos/v1/processos/1/partes`

#### Parametros e Payload (snake_case)

* [Utilize *underscore* (`_`) para separar palavras em parâmetros/*Use snake_case (never camelCase) for Query Parameters [130]*](https://opensource.zalando.com/restful-api-guidelines/index.html#130) [^7];
* [Utilize *underscore* (`_`) para separar palavras em nomes de campo/*Property names must be ASCII snake_case (and never camelCase) [118]*](https://opensource.zalando.com/restful-api-guidelines/index.html#118) [^7];

### Gerais

* [Utilize o princípio API Primeiro/*Follow API First Principle [100]*](https://opensource.zalando.com/restful-api-guidelines/index.html#100).
* [Aprove a definição de serviço com o cliente antes de implementá-lo/*Obtain Approval of Clients [185]*](https://opensource.zalando.com/restful-api-guidelines/index.html#185).
* Utilize a especificação [OpenAPI](https://swagger.io/specification/) da [Swagger](https://swagger.io/) para documentar e publicar os serviços [^1].
* Utilize as [ferramentas *open source*](https://swagger.io/tools/open-source) e as [integrações disponíveis](https://swagger.io/tools/open-source/open-source-integrations/) para sua linguagem de programação [^2].
* [Utilize o idioma do cliente, seja ele desenvolvedor ou usuário/*Write APIs in U.S. English [103]*](https://opensource.zalando.com/restful-api-guidelines/index.html#103).
* [Utilize o nível 2 do Modelo de Maturidade REST de Richardson/*Use REST Maturity Level 2 [162]*](https://opensource.zalando.com/restful-api-guidelines/index.html#162). Esse [nível](https://martinfowler.com/articles/richardsonMaturityModel.html) corresponde ao uso de comunicação baseada em recursos, verbos e códigos de situação.
* Utilize `curl` para criar exemplos de requisição e de resposta [^3], ou utilize o [Postman](https://www.postman.com/) para compartilhar os exemplos.
* Atenda às propriedades de uma API RESTful: serviços sem estado ([*Statelessness*](https://en.wikipedia.org/wiki/Representational_state_transfer#Statelessness)), suporte à [*cache*](https://en.wikipedia.org/wiki/Representational_state_transfer#Cacheability) e [arquitetura cliente servidor](https://en.wikipedia.org/wiki/Representational_state_transfer#Client–server_architecture).
* [Utilize o versionamento semântico `MAJOR.MINOR.PATCH`/*Use Semantic Versioning [116]*](https://opensource.zalando.com/restful-api-guidelines/index.html#116).
* Utilize [OAuth2](https://tools.ietf.org/html/rfc6749) para autorização de usuários.
* Utilize [OpenID Connect](https://auth0.com/docs/protocols/oidc) para autenticação de usuários.
* Utilize [HTTPS](https://tools.ietf.org/html/rfc2818) para proteger o acesso aos serviços.
* [Utilize permissões para autorizar os serviços/*Define and Assign Permissions (Scopes) [105]*](https://opensource.zalando.com/restful-api-guidelines/index.html#105).
* [Mantenha compatibilidade: não quebre contrato de serviços em uso/*Don’t Break Backward Compatibility [106]*](https://opensource.zalando.com/restful-api-guidelines/index.html#106).
* [Projete os serviços de forma conservadora/*Design APIs Conservatively [109]*](https://opensource.zalando.com/restful-api-guidelines/index.html#109). 
* [Utilize traço (`-`) para separar palavras em nomes de cabeçalhos/*Prefer Hyphenated-Pascal-Case for HTTP header Fields [132]*](https://opensource.zalando.com/restful-api-guidelines/index.html#132).
* [Utilize `false` em campos lógicos sem valor definido/*Boolean property values must not be null [122]*](https://opensource.zalando.com/restful-api-guidelines/index.html#122).
* [Remova os campos que não possuem valor definido/*Null values should have their fields removed [123]*](https://opensource.zalando.com/restful-api-guidelines/index.html#123).
* [Utilize  vazio (`[]`) para arrays sem valor definido/*Empty array values should not be null [124]*](https://opensource.zalando.com/restful-api-guidelines/index.html#124).
* [Utilize `0000-00-00` para datas, `00:00:00` para horários e demais formatos definidos na RFC 3339/*Date property values should conform to RFC 3339 [126]*](https://opensource.zalando.com/restful-api-guidelines/index.html#126).
* [Utilize os formatos de data e horário da RFC 3339/*Use Standard Date and Time Formats [169]*](https://opensource.zalando.com/restful-api-guidelines/index.html#169).
* [Utilize a estratégia de definir os tipos numéricos/*Define Format for Type Number and Integer [171]*](https://opensource.zalando.com/restful-api-guidelines/index.html#171).
* [Utilize o formato de objeto JSON para estruturar qualquer dado/*Use JSON to Encode Structured Data [167]*](https://opensource.zalando.com/restful-api-guidelines/index.html#167).

### Requisição

* Utilize apenas substantivos para nomear recursos[^4].
* Utilize versionamento na URL, informando o número correspondente à seção `MAJOR`, precedido da letra 'v' [^6].
* Utilize hierarquia de acordo com o vocabulário de negócio e não conforme a estrutura das tabelas de base de dados relacional.
* Utilize o cabeçalho `Accept-Language` para solicitar suporte a outros idiomas.
* Utilize o cabeçalho `Accept` para identicar o formato de resposta esperado ([negociação de conteúdo](https://restfulapi.net/content-negotiation/)).
* [Utilize plural para nomes de recursos/*Pluralize Resource Names [134]*](https://opensource.zalando.com/restful-api-guidelines/index.html#134).
* [Utilize recursos não ações/*Avoid Actions — Think About Resources [138]*](https://opensource.zalando.com/restful-api-guidelines/index.html#138).
* [Utilize identificadores de recurso sem verbo/*Keep URLs Verb-Free [141]*](https://opensource.zalando.com/restful-api-guidelines/index.html#141).
* [Utilize as propriedades idempotência e segurança adequadamente/*Fulfill Safeness and Idempotency Properties [149]*](https://opensource.zalando.com/restful-api-guidelines/index.html#149).
* [Utilize os métodos HTTP corretamente/*Use HTTP Methods Correctly [148]*](https://opensource.zalando.com/restful-api-guidelines/index.html#148).
* Utilize verbos/métodos HTTP para identificar as operações sobre os recursos, conforme a tabela a seguir.

| Verbo HTTP + recurso   | Descrição                                         | Sucesso | Erro     |
|------------------------|---------------------------------------------------|---------|--------  |
| GET    /resources      | Obtém uma coleção de recursos.                    | [200](https://httpstatuses.com/200)     | [400](https://httpstatuses.com/400)      |
| GET    /resources/{id} | Obtém os atributos e valores de um recurso.       | [200](https://httpstatuses.com/200)     | [400](https://httpstatuses.com/400), [404](https://httpstatuses.com/404) |
| POST   /resources      | Cria um novo recurso.                             | [201](https://httpstatuses.com/201)     | [409](https://httpstatuses.com/409)      |
| PUT    /resources      | Substitui o recurso por completo.                 | [204](https://httpstatuses.com/204)     | [400](https://httpstatuses.com/400), [404](https://httpstatuses.com/404) |
| PUT    /resources/{id} | Cria um recurso com identificador específico.     | [201](https://httpstatuses.com/201)     | [409](https://httpstatuses.com/409)      |
| PATCH  /resources      | Substitui alguns campos do recurso.               | [204](https://httpstatuses.com/204)     | [400](https://httpstatuses.com/400), [404](https://httpstatuses.com/404) |
| DELETE /resources/{id} | Apaga o recurso.                                  | [204](https://httpstatuses.com/204)     | [400](https://httpstatuses.com/400), [404](https://httpstatuses.com/404) |

* Utilize `sort=atributo1,atributoN` para classificar/ordenar coleções de recursos. A classificação crescente é o valor padrão.
* Utilize `desc=atributo1,atributoN` para classificar/ordenar em ordem decrescente.
* Utilize `first` para obter o primeiro recurso e `last` para obter o último.
* Utilize `count` para obter o tamanho da coleção.
* Utilize o nome de recurso `search`, combinado ao nome de parâmetro `q`, para realizar uma busca global em múltiplos recursos.
* Utilize parâmetros de consulta para filtrar recursos.

### Resposta

* [Utilize a definição do formato das respostas de sucesso e de erro/*Specify Success and Error Responses [151]*](https://opensource.zalando.com/restful-api-guidelines/index.html#151).
* [Utilize a estratégia entregar respostas de erro sem pilha de execução/*Do not expose Stack Traces [177]*](https://opensource.zalando.com/restful-api-guidelines/index.html#177).
* [Utilize o formato JSON como estrutura de dados agrupado em respostas, facilitando extensões/*Always Return JSON Objects As Top-Level Data Structures To Support Extensibility [110]*](https://opensource.zalando.com/restful-api-guidelines/index.html#110).
* Utilize *links* nas respostas para permitir descoberta e navegabilidade ([HATEOAS](https://en.wikipedia.org/wiki/HATEOAS)).
* Utilize o formato de resposta de erro conforme sugerido pela [OAuth2](https://tools.ietf.org/html/rfc6749#page-45) ou pela [RFC 7807](https://tools.ietf.org/html/rfc7807).
* Utilize os códigos de situação (*status code*) [HTTP](https://tools.ietf.org/html/rfc2616) conforme definido na [seção 10 da especificação](https://tools.ietf.org/html/rfc2616#section-10).
* [Utilize os códigos de situação definidos no HTTP/*Use Standard HTTP Status Codes [150]*](https://opensource.zalando.com/restful-api-guidelines/index.html#150).
* Utilize os códigos de situação de modo consistente, considerando a tabela a seguir. O mínimo recomendado é responder [200](https://httpstatuses.com/200) para sucesso, [400](https://httpstatuses.com/400) para qualquer erro referente à requisição do cliente e [500](https://httpstatuses.com/500) para erro de servidor.

| Verbo HTTP    | *Status code* HTTP                                        | Descrição                                                                                                                                                                                                 |
|---------------|-----------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Sucesso       | [200 OK](https://httpstatuses.com/200)                    | Código de sucesso básico, funciona para a maioria dos casos. Usado especialmente no sucesso do primeiro *request* GET ou *update* com PUT/PATCH.                                                          |
|               | [201 Created](https://httpstatuses.com/201)               | Indica que o recurso foi criado. Resposta típica a um *request* PUT ou POST.                                                                                                                              |
|               | [202 Accepted](https://httpstatuses.com/202)              | Indica que o *request* foi aceito para processamento. Resposta típica a uma chamada para processamento assíncrono (para melhor UX e boa performance).                     |
|               | [204 No Content](https://httpstatuses.com/204)            | O request funcionou, mas não há conteúdo a retornar. Resposta comum para um DELETE com sucesso.                                                                                                           |
|               | [206 Partial Content](https://httpstatuses.com/206)       | O recurso retornado está incompleto. Usado normalmente em recursos paginados.                                                                                                                             |
| Erro cliente  | [400 Bad request](https://httpstatuses.com/400)           | Erro geral para qualquer *request* (caso não se encaixe nos demais). A boa prática é ter dois tipos de erros: erro no *request*, e condição de erro na aplicação.                                         |
|               | [401 Unauthorized](https://httpstatuses.com/401)          | Não reconhece o ID. Para verificar a autorização, é preciso confirmar a identidade do usuário.                                                                                                            |
|               | [403 Forbidden](https://httpstatuses.com/403)             | Autenticação correta, mas não há privilégios suficientes.                                                                                                                                                 |
|               | [404 Not Found](https://httpstatuses.com/404)             | O recurso solicitado não existe.                                                                                                                                                                          |
|               | [405 Method Not Allowed](https://httpstatuses.com/405)    | Solicitação de um método que não faz sentido neste recurso, ou o usuário não tem permissão para fazer essa chamada.                                                                                       |
|               | [406 Not Acceptable](https://httpstatuses.com/406)        | Nenhum formato solicitado por meio de cabeçalho com prefixo `Accept` é suportado. Por exemplo: a resposta foi solicitada em formato XML, mas o recurso só está disponível no formato JSON; o idioma português (`pt`) foi solicitado, mas só é suportado o idioma inglês (`en`).
|               | [412 Precondition Failed](https://httpstatuses.com/412)   | Valor de cabeçalho de requisição não foi aceito pelo servidor.
| Erro servidor | [500 Internal server Error](https://httpstatuses.com/500) | A requisição está correta, mas ocorreu um erro de execução. Não há muito que o cliente possa fazer sobre isso. Portanto, apenas retorne um status 500.                                                    |

* [Utilize paginação em respostas com coleções/*Support pagination [159]*](https://opensource.zalando.com/restful-api-guidelines/index.html#159), com exceção das coleções de erros como resposta da validação de atributos e parâmetros de entrada.
* Utilize resposta [HTTP 206](https://httpstatuses.com/206) para indicar uma resposta parcial consequente de paginação.
* Utilize [snake_case](https://en.wikipedia.org/wiki/Snake_case) para destacar as palavras em campos da resposta [^7].

## Referências

* [*Preliminary Analysis of REST API Style Guidelines*](http://www.cs.cmu.edu/~NatProg/papers/API-Usability-Styleguides-PLATEAU2017.pdf): um artigo estilo "estado da arte" publicado pela Universidade de Carnegie.
* [*Microsoft REST API Guidelines*](https://github.com/Microsoft/api-guidelines/blob/master/Guidelines.md): guia de recomendações da Microsoft.
* [*Zalando RESTful API and Event Scheme Guidelines*](https://opensource.zalando.com/restful-api-guidelines/index.html): guia de recomendações da Zalando, com a lista detalhada de recomendações com explicações e exemplos.
* [*REST API Tutorial*](https://restfulapi.net).
* [*Design Beautiful REST + JSON APIs*](http://www.slideshare.net/stormpath/rest-jsonapis).
* [*Web API Design: Crafting Interfaces that Developers Love*](https://pages.apigee.com/web-api-design-website-h-ebook-registraSon.html).
* [*HTTP API Design Guide*](https://github.com/interagent/hyp-api-design).
* [*RESTful Web	APIs*](http://shop.oreilly.com/product/0636920028468.do).
* [*Richardson Maturity Model*](https://martinfowler.com/articles/richardsonMaturityModel.html).

## Notas

[^1]: Padrão suportado pela maioria das linguagens de programação, incluindo: Java, Javascript, Python e Object Pascal/Delphi. [RAML](https://raml.org) e [API Blueprint](https://apiblueprint.org) são alternativas mais conhecidas.

[^2]: Essas ferramentas facilitam a documentação, incluindo facilidades como a geração automática a partir de código fonte.

[^3]: [curl](https://curl.haxx.se) é um comando suportado ou instalável no terminal dos principais sistemas operacionais.

[^4]: `/usuarios`, `/processos`, `/documentos`. Não utilize verbos, como em `usuários/salvar`, `processos/cadastrar`.

[^5]: `/usuarios/joao`, `/processos`, `/documentos`. Não utilize singular, como em `usuario/joao`, `processo/2018001`.

[^6]: Como em `/api/v1/usuarios`.

[^7]: `formato_documento` e não `formatoDocumento`, `codigo_usuario` e não `codigoUsuario`.
