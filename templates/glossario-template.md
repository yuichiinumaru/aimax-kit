# Glossário — Linguagem Ubíqua

**Projeto**: [NOME DO PROJETO]  
**Atualizado**: [DATA]  
**Versão**: 1.0  
**Status**: [Draft | Em Revisão | Aprovado]

---

## Propósito

Este glossário define os **termos canônicos** usados em todo o projeto. Todos os participantes (desenvolvedores, product owners, stakeholders, documentação, código, testes, BDD) devem usar estes termos de forma consistente.

**Regra de Ouro**: Todo termo usado em `features/*.feature` (BDD), especificações, código e documentação DEVE estar definido aqui.

---

## Como Usar Este Glossário

1. **Adicionar Termo**: Quando introduzir um novo conceito do domínio, adicione-o aqui PRIMEIRO.
2. **Consultar**: Sempre que houver dúvida sobre um termo, consulte este documento.
3. **Atualizar**: Se o significado de um termo evoluir, atualize aqui e notifique o time.
4. **Evitar Sinônimos**: Use um único termo canônico. Liste sinônimos apenas para mapeamento.

---

## Termos do Domínio

### [Termo 1 - Exemplo: Tarefa]

**Definição**: Unidade de trabalho atribuível a um membro do time, com estado rastreável e prazo definido.

**Sinônimos**: Task, To-do, Item de Trabalho (evite usar; sempre use "Tarefa")

**Atributos Conceituais**:
- Título (texto curto descritivo)
- Descrição (texto longo opcional)
- Estado (ex: Nova, Em Progresso, Concluída, Bloqueada)
- Responsável (membro do time)
- Prazo estimado (data ou duração)
- Prioridade (Alta, Média, Baixa)

**Relacionamentos**:
- Pertence a um **Projeto**
- Pode ter subtarefas (outras **Tarefas**)
- Pode estar vinculada a uma **Issue** externa (GitHub, GitLab)
- Pode gerar **Notificações**

**Invariantes** (regras que devem sempre ser verdadeiras):
- Uma Tarefa sempre tem um Estado válido
- Uma Tarefa Concluída não pode ser reaberta sem auditoria
- Uma Tarefa deve ter ao menos um Responsável se Estado != "Nova"

**Exemplo de Uso**:
> "O usuário cria uma nova **Tarefa** com prioridade Alta e a atribui a João."

---

### [Termo 2 - Exemplo: Projeto]

**Definição**: Agrupamento lógico de Tarefas relacionadas a um objetivo ou entrega específica.

**Sinônimos**: Workspace, Board (evite; sempre use "Projeto")

**Atributos Conceituais**:
- Nome (único, texto curto)
- Descrição (opcional)
- Data de criação
- Owner (responsável principal)
- Membros (lista de usuários com acesso)
- Estado (Ativo, Arquivado, Concluído)

**Relacionamentos**:
- Contém múltiplas **Tarefas**
- Pertence a uma **Organização**
- Pode ter **Integrações** habilitadas (GitHub, Slack, etc.)

**Invariantes**:
- Um Projeto deve ter ao menos um Owner
- Um Projeto Arquivado não aceita novas Tarefas
- Nome de Projeto deve ser único dentro de uma Organização

**Exemplo de Uso**:
> "O **Projeto** 'Website Redesign' contém 45 **Tarefas** distribuídas entre 3 membros do time."

---

### [Termo 3 - Exemplo: Usuário]

**Definição**: Pessoa autenticada no sistema com permissões e perfil definidos.

**Sinônimos**: User, Member (contexto específico), Colaborador

**Atributos Conceituais**:
- Nome completo
- Email (único, usado para autenticação)
- Papel (Admin, Membro, Observador)
- Avatar (imagem opcional)
- Status (Ativo, Inativo, Suspenso)

**Relacionamentos**:
- Pertence a uma ou mais **Organizações**
- Pode ser membro de múltiplos **Projetos**
- Pode ser responsável por múltiplas **Tarefas**
- Recebe **Notificações**

**Invariantes**:
- Email deve ser único no sistema
- Um Usuário Suspenso não pode criar ou modificar Tarefas
- Um Usuário deve ter ao menos um Papel em cada Organização

**Exemplo de Uso**:
> "O **Usuário** João Silva é Admin da **Organização** Acme Corp e membro de 3 **Projetos**."

---

### [Termo 4 - Exemplo: Notificação]

**Definição**: Mensagem assíncrona enviada a um Usuário sobre eventos relevantes (mudanças em Tarefas, menções, etc.).

**Sinônimos**: Alerta, Aviso (evite; use "Notificação")

**Atributos Conceituais**:
- Tipo (Menção, Mudança de Estado, Prazo Próximo, etc.)
- Destinatário (**Usuário**)
- Conteúdo (texto descritivo)
- Link (para o recurso relacionado)
- Timestamp
- Estado (Não Lida, Lida, Descartada)

**Relacionamentos**:
- Relacionada a uma **Tarefa**, **Projeto** ou **Comentário**
- Destinada a um **Usuário**

**Invariantes**:
- Notificações não podem ser alteradas após criação (apenas estado Lida/Não Lida)
- Notificações descartadas podem ser recuperadas por até 30 dias

**Exemplo de Uso**:
> "O sistema envia uma **Notificação** para Maria quando João menciona ela em um comentário."

---

### [Adicione mais termos conforme necessário]

---

## Entidades de Domínio

### [Entidade 1 - Exemplo: Organização]

**Descrição**: Representa uma empresa, time ou grupo que usa o sistema. É a raiz da hierarquia de acesso.

**Atributos-Chave** (conceituais, não implementação):
- Nome (único globalmente)
- Plano de assinatura (Free, Pro, Enterprise)
- Limite de usuários (baseado no plano)
- Configurações (timezone, idioma padrão, etc.)

**Relacionamentos**:
- Contém múltiplos **Usuários**
- Contém múltiplos **Projetos**
- Pode ter **Integrações** globais habilitadas

**Invariantes**:
- Nome de Organização deve ser único
- Uma Organização no plano Free tem limite de 5 usuários
- Não pode ser deletada se tiver Projetos ativos

---

### [Entidade 2 - Exemplo: Integração]

**Descrição**: Conexão com serviço externo (GitHub, GitLab, Slack, etc.) para sincronização de dados ou notificações.

**Atributos-Chave**:
- Tipo (GitHub, GitLab, Slack, Jira, etc.)
- Estado (Ativa, Inativa, Erro de Autenticação)
- Configuração (tokens, webhooks, mapeamentos)
- Escopo (Organização ou Projeto específico)

**Relacionamentos**:
- Pertence a uma **Organização** ou **Projeto**
- Pode criar automaticamente **Tarefas** (ex: de Issues do GitHub)
- Pode enviar **Notificações** para serviços externos

**Invariantes**:
- Uma Integração deve ter credenciais válidas para estar Ativa
- Integrações com Erro de Autenticação são pausadas após 3 tentativas
- Cada Organização pode ter no máximo 1 integração de cada tipo

---

## Processos de Negócio (Termos de Ação)

### [Processo 1 - Exemplo: Atribuir Tarefa]

**Definição**: Ação de associar um **Usuário** como responsável por uma **Tarefa**.

**Pré-condições**:
- Usuário deve ser membro do **Projeto**
- Tarefa deve estar em estado válido (não Concluída ou Arquivada)

**Pós-condições**:
- Tarefa tem campo Responsável atualizado
- **Notificação** enviada ao novo responsável
- Histórico de mudança registrado

**Exemplo**:
> "João **atribui** a **Tarefa** #123 para Maria."

---

### [Processo 2 - Exemplo: Concluir Tarefa]

**Definição**: Ação de marcar uma **Tarefa** como Concluída, finalizando o trabalho.

**Pré-condições**:
- Usuário deve ser o responsável pela Tarefa ou Admin do Projeto
- Tarefa deve estar em estado "Em Progresso"

**Pós-condições**:
- Estado da Tarefa muda para "Concluída"
- Timestamp de conclusão registrado
- **Notificações** enviadas a observadores
- Tarefa pode disparar automações (ex: fechar Issue no GitHub)

**Exemplo**:
> "Maria **conclui** a **Tarefa** #123 após finalizar o código."

---

## Estados e Transições

### [Estado 1 - Exemplo: Estados de Tarefa]

**Estados Válidos**:
- **Nova**: Tarefa criada mas não iniciada
- **Em Progresso**: Trabalho ativo
- **Bloqueada**: Impedimento externo
- **Em Revisão**: Aguardando aprovação
- **Concluída**: Trabalho finalizado
- **Arquivada**: Removida do fluxo ativo

**Transições Permitidas**:
```
Nova → Em Progresso
Em Progresso → Bloqueada
Em Progresso → Em Revisão
Bloqueada → Em Progresso
Em Revisão → Concluída
Em Revisão → Em Progresso (se reprovada)
Concluída → Arquivada
```

**Transições Proibidas**:
- Concluída → Em Progresso (requer reabrir com auditoria)
- Arquivada → qualquer outro estado (deve ser desarquivada primeiro)

---

## Regras de Negócio

### RN-001: Limite de Tarefas Ativas

**Descrição**: Cada usuário não pode ter mais de 10 Tarefas "Em Progresso" simultaneamente.

**Justificativa**: Evitar sobrecarga e promover foco.

**Exceção**: Admins podem ultrapassar o limite mediante justificativa.

---

### RN-002: Prazo de Tarefas

**Descrição**: Tarefas com prazo expirado há mais de 30 dias sem atividade são automaticamente movidas para "Bloqueada" com notificação.

**Justificativa**: Manter backlog limpo e identificar trabalho estagnado.

**Exceção**: Tarefas marcadas como "Baixa Prioridade" têm prazo de 60 dias.

---

### RN-003: Permissões de Projeto

**Descrição**: Apenas Owners e Admins podem arquivar ou deletar **Projetos**.

**Justificativa**: Evitar perda acidental de dados críticos.

**Exceção**: Nenhuma.

---

## Anti-Padrões (Termos a Evitar)

### ❌ Ticket → Use: **Tarefa**
**Razão**: "Ticket" é jargão de ferramentas específicas (Jira). Nosso termo canônico é "Tarefa".

---

### ❌ Board → Use: **Projeto**
**Razão**: "Board" é específico de ferramentas tipo Kanban. "Projeto" é mais genérico e alinhado com nossa visão.

---

### ❌ Sprint → Use: **Milestone** ou **Fase**
**Razão**: "Sprint" é jargão Scrum. Somos agnósticos de metodologia.

---

### ❌ Story → Use: **Tarefa** ou **Requisito**
**Razão**: "Story" (user story) é específico de Agile. Dependendo do contexto, use o termo apropriado.

---

## Abreviações Permitidas

| Abreviação | Termo Completo | Contexto |
|------------|----------------|----------|
| **PR** | Pull Request | Integrações com GitHub/GitLab |
| **NFR** | Non-Functional Requirement | Documentação técnica |
| **BDD** | Behavior-Driven Development | Testes e features |
| **UC** | Use Case | Atores e casos de uso |
| **ADR** | Architecture Decision Record | Decisões de arquitetura |

---

## Mapeamento de Termos Externos

Quando integrar com sistemas externos, use este mapeamento:

| Sistema Externo | Termo Externo | Nosso Termo |
|-----------------|---------------|-------------|
| **GitHub** | Issue | **Tarefa** (quando sincronizada) |
| **GitHub** | Pull Request | **PR** (termo aceito) |
| **Jira** | Ticket | **Tarefa** |
| **Jira** | Epic | **Projeto** ou **Milestone** |
| **Trello** | Card | **Tarefa** |
| **Trello** | Board | **Projeto** |
| **Slack** | Channel | **Canal de Notificação** |

---

## Convenções de Nomenclatura

### Para Código
- Classes/Modelos: Use singular (`Task`, não `Tasks`)
- Coleções: Use plural (`tasks_list`, `projects`)
- Booleanos: Use `is_`, `has_`, `can_` (ex: `is_completed`, `has_deadline`)

### Para Banco de Dados
- Tabelas: Use plural lowercase com underscore (`tasks`, `projects`, `user_notifications`)
- Colunas: Use snake_case (`created_at`, `assigned_to_user_id`)

### Para API REST
- Recursos: Use plural (`/api/tasks`, `/api/projects`)
- Ações: Use verbos HTTP (`POST /tasks`, `PUT /tasks/123`, `DELETE /tasks/123`)

---

## Histórico de Revisões

| Versão | Data | Autor | Mudanças Principais |
|--------|------|-------|---------------------|
| 1.0 | [DATA] | [NOME] | Versão inicial |
| 1.1 | [DATA] | [NOME] | Adicionados termos de Integração |
| 1.2 | [DATA] | [NOME] | Refinadas regras de negócio |

---

## Validação

### Checklist de Qualidade
- [ ] Todos os termos em `features/*.feature` estão definidos aqui
- [ ] Não há sinônimos usados no código (apenas termos canônicos)
- [ ] Regras de negócio estão documentadas
- [ ] Anti-padrões estão claramente marcados
- [ ] Mapeamento de termos externos está atualizado

---

**Nota**: Este glossário é um **documento vivo**. Atualize-o sempre que novos termos forem introduzidos ou significados evoluírem. Notifique o time sobre mudanças significativas.

**Próximos Passos**:
1. Revisar com stakeholders para validar terminologia
2. Integrar termos no `features/backlog-bdd.feature`
3. Garantir consistência no código-fonte
4. Referenciar este documento em `visao-escopo.md` e `atores-casos-uso.md`
