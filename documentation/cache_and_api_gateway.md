Caching¶
A principal razão para o uso de cache está relacionado ao desempenho da aplicação. A segunda razão, é diminuir custos, evitando o consumo de recursos (rede, por exemplo).

Estratégias de caching podem ser utilizadas das mais diversas maneiras. No mundo dos microserviços, deve-se avaliar o uso do cache pensando nas seguintes situações:

Instâncias/Containers desaparecem;
A Rede/Conectividade vai falhar em algum momento;
Zonas/Regiões se tornam instáveis.
As seguintes premissas também são aplicáveis:

Dados são frequentemente escritos uma vez e lido muitas vezes;
Dados “Stale” são normalmente aceitáveis.
Para saber mais, acesse:

The Role of Caching in Large Scale Architecture;
In-Process Caching vs. Distributed Caching.
Sugestões de implementações de cache:¶
Rend;
Rocksdb.org;
EVCache;
Redis;
Memcached;
Guava.
API Gateway¶
Basicamente, o gateway é uma interface que recebe as chamadas para seus sistemas internos, sendo uma grande porta de entrada.

Problemas/necessidades que resolve:¶
Existências de tipos de aplicação cliente diferente (web, mobile, cloud, desktop, lambda etc.), cada uma solicitando uma versão diferente das APIs;
Necessidade de exposição de um único endpoint para os clientes;
Necessidade de limitar a banda (Rate Limit) de acordo com regras específicas;
Necessidade de Segurança, Autenticação e Autorização;
Necessidade de extração de métricas do uso de APIs;
Transcrição entre SOAP & REST;
Mesclar múltiplos Serviços;
Mesclar alvos HTTP com HTTPS;
Transcrição entre XML & JSON;
Proteção contra ataques de negação de serviço;
Proteção contra ataques de injeção.
Sugestões para avaliação:¶
Spring Zuul;
Kong hq;
ApiUmbrella.io;
Ggravitee.io.
