# Python

Template for Python repository.

## Commits


| Tipo de Commit       | Exemplo de Mensagem de Commit                                                                 | Resultado na Versão |
|----------------------|-----------------------------------------------------------------------------------------------|----------------------|
| **MAJOR**            | `feat: muda contrato da API\n\nBREAKING CHANGE: remove campo 'email' da resposta do endpoint` | 1.x.x (MAJOR)        |
| **MAJOR**            | `refactor!: troca sistema de autenticação para OAuth`                                         | 1.x.x (MAJOR)        |
| **MINOR**            | `feat: adiciona suporte a exportação em CSV`                                                  | x.1.x (MINOR)        |
| **MINOR**            | `feat: novo endpoint para consulta de usuários`                                               | x.1.x (MINOR)        |
| **PATCH**            | `fix: corrige bug no cálculo de imposto`                                                      | x.x.1 (PATCH)        |
| **PATCH**            | `chore: atualiza dependência do requests`                                                     | x.x.1 (PATCH)        |
| **PATCH**            | `refactor: melhora legibilidade da função de validação`                                       | x.x.1 (PATCH)        |


#### Patch

```
fix: corrige bug no login de usuários
chore: atualiza dependência requests
refactor: melhora leitura do código de autenticação
```

### Minor 

```
feat: novo endpoint para consultar produtos por nome
```

### Major

```
git commit -m "feat: altera formato da resposta da API de produtos

BREAKING CHANGE: o campo 'preco' agora é um objeto com 'valor' e 'moeda'"
```

## References

- https://superuser.com/questions/816143/how-to-run-pip-in-non-interactive-mode
- https://docs.pytest.org/en/stable/reference/customize.html
- https://www.conventionalcommits.org/en/v1.0.0/
- https://keepachangelog.com/en/1.0.0/
- https://semver.org/
- https://12factor.net/pt_br/