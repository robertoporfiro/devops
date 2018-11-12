Mensagens de commit 

# Structure
As mensagens de commit são compostas por três partes distintas separadas por uma linha em branco: o título, um corpo opcional e um rodapé opcional. Veja o layout abaixo: 
- type: (obrigatório) 
- body (opcional)
- tail (opcional)

## Type
Exemplos: 
- **feat:** um novo recurso 
- **fix:** uma correção de bug 
- **docs:** mudanças em documentações 
- **style:** formatação, dois pontos ausentes, etc. (não envolve mudança de código) 
- **refactor:** refatoração do código de produção 
- **test:** adição e refatoração de testes (não envolve mudanças no código de produção) 
- **chore:** atualização de tarefas de compilação, configurações do gerenciador de pacotes, etc. (não envolve mudanças no código de produção) 


## Body
- Use o corpo para explicar o que e o porquê de um commit, não o “como”.
- Os corpos não podem ter mais do que 50 caracteres, devem começar com uma letra maiúscula e não devem ser encerrados com ponto.

### Forbidden
Não use frases como "eu corrigi" ou "eu fiz algo"; ele precisa ser claro e informativo.  

### Allow
Use verbos no imperativo para descrever o que um commit faz, não o que ele fez. Por exemplo, use “mudar”, não “mudou” ou “muda”. 

 
## Tail
- Mencionar IDs do rastreador de falhas.
- Exemplos:<br/>
```Resolve: # 123
Ver também: # 456, # 789```



 

 

Guia de estilo da Udacity para mensagens de commit no Git 

https://docs.google.com/document/d/1lwthXzmGcTVa-eTnCJEHVDRoCT9ffwvflJeesD82mt4/edit# 