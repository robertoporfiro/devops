# Structure
As mensagens de commit são compostas por três partes distintas separadas por uma linha em branco: o título, um corpo opcional e um rodapé opcional. Veja o layout abaixo: 
- head: (obrigatório) 
- body (optional)

## Head
- Head must has maximum 50 characters.
- Don´t use “.” or “…”
Exemplos: 
- **feat:** um novo recurso <br/>
`git commit -m "feat: new "`
- **fix:** uma correção de bug <br/>
`git commit -m "fix: reference "`
- **docs:** mudanças em documentações <br/>
`git commit -m "docs:  "`
- **style:** formatação, dois pontos ausentes, etc. (não envolve mudança de código) <br/>
`git commit -m "style:  "`
- **refactor:** refatoração do código de produção <br/>
`git commit -m "refactor:  "`
- **test:** adição e refatoração de testes (não envolve mudanças no código de produção) <br/>
`git commit -m "test:  "`
- **chore:** atualização de tarefas de compilação, configurações do gerenciador de pacotes, etc. (não envolve mudanças no código de produção) <br/>
`git commit -m "chore: add configuration about  "`


## Body
- Ex<br/>
 
 If applied, this PR will
- [x] Update version
- [x] resolve problem
- [x] create test to
- [ ] remove 

### Forbidden
Não use frases como "eu corrigi" ou "eu fiz algo"; ele precisa ser claro e informativo.  

### Allow
Use verbos no imperativo para descrever o que um commit faz, não o que ele fez. Por exemplo, use “mudar”, não “mudou” ou “muda”. 

 
## Tail
- Mencionar IDs do rastreador de falhas.
- Exemplos:<br/>
```Resolve: # 123
Ver também: # 456, # 789```
