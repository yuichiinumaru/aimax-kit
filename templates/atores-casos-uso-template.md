# Atores e Casos de Uso

**Projeto**: [NOME DO PROJETO]  
**Atualizado**: [DATA]  
**Versão**: 1.0  
**Status**: [Draft | Em Revisão | Aprovado]

---

## Propósito

Este documento identifica os **atores** (pessoas, sistemas ou serviços) que interagem com o sistema e descreve os **casos de uso** que representam suas interações. Cada caso de uso deve estar vinculado a cenários BDD em `features/*.feature`.

**Regra**: Todo caso de uso deve ter ao menos um cenário BDD correspondente.

---

## Visão Geral

### Diagrama de Contexto

```
┌─────────────────────────────────────────────────────────────┐
│                    [NOME DO SISTEMA]                        │
│                                                             │
│  ┌───────────────┐      ┌───────────────┐                 │
│  │   Subsistema  │      │   Subsistema  │                 │
│  │       A       │◄────►│       B       │                 │
│  └───────────────┘      └───────────────┘                 │
│         ▲                       ▲                           │
└─────────┼───────────────────────┼───────────────────────────┘
          │                       │
          │                       │
    ┌─────▼──────┐         ┌─────▼──────┐
    │   Ator 1   │         │   Ator 2   │
    │  (Humano)  │         │ (Sistema)  │
    └────────────┘         └────────────┘
```

---

## Atores

### Classificação de Atores

#### Atores Primários (Iniciam interações)
- Atores que disparam casos de uso ativamente
- Têm objetivos específicos a alcançar com o sistema

#### Atores Secundários (Suportam interações)
- Sistemas ou serviços que o sistema consome
- Fornecem dados ou funcionalidades necessárias

---

### Ator Primário 1: [Nome do Ator - Ex: Desenvolvedor]

**Tipo**: Humano / Sistema / Serviço Externo

**Descrição**: 
[Descreva quem é este ator. Ex: "Desenvolvedor de software que usa o sistema para gerenciar tarefas de sua equipe."]

**Objetivos**:
- [Objetivo 1, ex: "Visualizar tarefas atribuídas a si mesmo"]
- [Objetivo 2, ex: "Atualizar o estado de tarefas em progresso"]
- [Objetivo 3, ex: "Receber notificações sobre menções ou mudanças"]

**Contexto de Uso**:
- **Quando**: [Ex: "Durante o dia de trabalho, especialmente no início e fim do dia"]
- **Onde**: [Ex: "Desktop (navegador) ou mobile (app responsivo)"]
- **Frequência**: [Ex: "Múltiplas vezes por dia (5-10 sessões)"]

**Características**:
- **Habilidade Técnica**: [Ex: "Alta - familiarizado com ferramentas de gestão de projetos"]
- **Experiência com Domínio**: [Ex: "Média - conhece processos de desenvolvimento ágil"]
- **Acesso**: [Ex: "Autenticado, papel de 'Membro' ou 'Admin'"]

**Casos de Uso Relacionados**:
- UC-001: [Nome do caso de uso]
- UC-003: [Nome do caso de uso]
- UC-007: [Nome do caso de uso]

---

### Ator Primário 2: [Nome do Ator - Ex: Product Owner]

**Tipo**: Humano

**Descrição**: 
[Ex: "Responsável por definir prioridades e acompanhar progresso de projetos."]

**Objetivos**:
- [Objetivo 1, ex: "Criar novos projetos e definir estrutura de tarefas"]
- [Objetivo 2, ex: "Priorizar tarefas e redistribuir responsabilidades"]
- [Objetivo 3, ex: "Visualizar métricas de progresso (burndown, throughput)"]

**Contexto de Uso**:
- **Quando**: [Ex: "Durante planning, daily standups e revisões semanais"]
- **Onde**: [Ex: "Desktop (navegador)"]
- **Frequência**: [Ex: "Diariamente, sessões de 15-30 minutos"]

**Características**:
- **Habilidade Técnica**: [Ex: "Média - conhece ferramentas básicas"]
- **Experiência com Domínio**: [Ex: "Alta - veterano em gestão de produtos"]
- **Acesso**: [Ex: "Autenticado, papel de 'Owner' ou 'Admin'"]

**Casos de Uso Relacionados**:
- UC-002: [Nome do caso de uso]
- UC-004: [Nome do caso de uso]
- UC-008: [Nome do caso de uso]

---

### Ator Primário 3: [Nome do Ator - Ex: Observador]

**Tipo**: Humano

**Descrição**: 
[Ex: "Stakeholder que acompanha progresso mas não participa ativamente da execução."]

**Objetivos**:
- [Objetivo 1, ex: "Visualizar status geral de projetos"]
- [Objetivo 2, ex: "Receber relatórios periódicos"]
- [Objetivo 3, ex: "Comentar em tarefas críticas"]

**Contexto de Uso**:
- **Quando**: [Ex: "Semanalmente, em revisões ou sob demanda"]
- **Onde**: [Ex: "Desktop ou mobile"]
- **Frequência**: [Ex: "1-2 vezes por semana"]

**Características**:
- **Habilidade Técnica**: [Ex: "Baixa a média"]
- **Experiência com Domínio**: [Ex: "Variável"]
- **Acesso**: [Ex: "Autenticado, papel de 'Observador' (somente leitura)"]

**Casos de Uso Relacionados**:
- UC-009: [Nome do caso de uso]
- UC-010: [Nome do caso de uso]

---

### Ator Secundário 1: [Nome do Ator - Ex: Sistema GitHub]

**Tipo**: Sistema Externo (API)

**Descrição**: 
[Ex: "API do GitHub que fornece dados de issues, pull requests e commits."]

**Objetivo no Sistema**:
- [Ex: "Sincronizar issues como tarefas"]
- [Ex: "Notificar sobre mudanças em PRs vinculados"]

**Interface**:
- **Protocolo**: [Ex: "REST API (HTTPS)"]
- **Autenticação**: [Ex: "OAuth 2.0 / Personal Access Token"]
- **Frequência de Comunicação**: [Ex: "Webhooks (tempo real) + polling (a cada 5 min)"]

**Casos de Uso Relacionados**:
- UC-005: [Nome do caso de uso]
- UC-006: [Nome do caso de uso]

---

### Ator Secundário 2: [Nome do Ator - Ex: Serviço de E-mail]

**Tipo**: Serviço Externo (SaaS)

**Descrição**: 
[Ex: "SendGrid ou AWS SES para envio de notificações por e-mail."]

**Objetivo no Sistema**:
- [Ex: "Enviar notificações quando webhooks internos não são suficientes"]
- [Ex: "Enviar relatórios periódicos"]

**Interface**:
- **Protocolo**: [Ex: "SMTP ou REST API"]
- **Autenticação**: [Ex: "API Key"]
- **Frequência de Comunicação**: [Ex: "Sob demanda (eventos) + diários (relatórios)"]

**Casos de Uso Relacionados**:
- UC-011: [Nome do caso de uso]

---

## Casos de Uso

### UC-001: [Nome do Caso de Uso - Ex: Criar Nova Tarefa]

**Ator Primário**: [Nome do Ator, ex: Desenvolvedor]  
**Atores Secundários**: [Se houver, ex: Sistema GitHub]

**Descrição**: 
[Breve descrição do que este caso de uso faz. Ex: "Permite que um desenvolvedor crie uma nova tarefa no sistema, definindo título, descrição, prioridade e responsável."]

**Pré-condições**:
- [Condição 1, ex: "Usuário está autenticado"]
- [Condição 2, ex: "Usuário é membro do projeto"]
- [Condição 3, ex: "Projeto está no estado 'Ativo'"]

**Pós-condições**:
- [Resultado 1, ex: "Nova tarefa criada com estado 'Nova'"]
- [Resultado 2, ex: "Notificação enviada ao responsável (se atribuído)"]
- [Resultado 3, ex: "Evento registrado no log de auditoria"]

**Cenário Principal (Fluxo de Sucesso)**:
1. Usuário navega para o projeto desejado
2. Usuário clica em "Nova Tarefa"
3. Sistema exibe formulário de criação
4. Usuário preenche:
   - Título (obrigatório)
   - Descrição (opcional)
   - Prioridade (padrão: Média)
   - Responsável (opcional, pode ser auto-atribuído)
   - Prazo estimado (opcional)
5. Usuário clica em "Criar"
6. Sistema valida campos obrigatórios
7. Sistema cria tarefa com ID único
8. Sistema exibe mensagem de sucesso
9. Sistema redireciona para visualização da tarefa criada

**Cenários Alternativos**:

- **3a. Usuário cancela criação**:
  - 3a1. Usuário clica em "Cancelar"
  - 3a2. Sistema descarta dados preenchidos
  - 3a3. Sistema retorna à lista de tarefas

- **6a. Validação falha (título vazio)**:
  - 6a1. Sistema exibe mensagem de erro: "Título é obrigatório"
  - 6a2. Sistema mantém dados preenchidos no formulário
  - 6a3. Retorna ao passo 4

- **7a. Integração com GitHub habilitada**:
  - 7a1. Sistema pergunta: "Criar issue no GitHub?"
  - 7a2. Se sim, sistema cria issue via API
  - 7a3. Sistema vincula tarefa à issue
  - 7a4. Continua no passo 8

**Cenários de Exceção**:

- **E1. Erro de rede ao salvar**:
  - E1.1. Sistema exibe mensagem: "Erro ao salvar. Tente novamente."
  - E1.2. Sistema mantém dados preenchidos
  - E1.3. Sistema oferece opção de "Salvar Rascunho Localmente"

- **E2. Usuário perde permissão durante criação**:
  - E2.1. Sistema detecta mudança de permissão
  - E2.2. Sistema exibe mensagem: "Você não tem mais permissão para criar tarefas neste projeto"
  - E2.3. Sistema redireciona para página principal

**Requisitos Não-Funcionais Relacionados**:
- **Performance**: Criação deve completar em < 500ms (p95)
- **Usabilidade**: Formulário deve ter validação em tempo real
- **Acessibilidade**: Formulário deve ser navegável por teclado

**Regras de Negócio Aplicáveis**:
- RN-001: Limite de tarefas ativas (ver glossário)
- RN-003: Permissões de projeto (ver glossário)

**Cenários BDD Relacionados**:
- `@ID-001` em `features/tasks.feature`: "Criar tarefa com campos mínimos"
- `@ID-002` em `features/tasks.feature`: "Criar tarefa com integração GitHub"
- `@ID-003` em `features/tasks.feature`: "Validação de campos obrigatórios"

**Prioridade**: [Alta | Média | Baixa]  
**Complexidade**: [Baixa | Média | Alta]  
**Risco**: [Baixo | Médio | Alto]

---

### UC-002: [Nome do Caso de Uso - Ex: Atualizar Estado de Tarefa]

**Ator Primário**: [Desenvolvedor, Product Owner]  
**Atores Secundários**: [Sistema de Notificações]

**Descrição**: 
[Ex: "Permite que usuários autorizados mudem o estado de uma tarefa (Nova → Em Progresso → Concluída, etc.)"]

**Pré-condições**:
- [Ex: "Usuário está autenticado"]
- [Ex: "Usuário tem permissão para modificar a tarefa (responsável ou admin)"]
- [Ex: "Tarefa existe e não está arquivada"]

**Pós-condições**:
- [Ex: "Estado da tarefa atualizado"]
- [Ex: "Timestamp de mudança registrado"]
- [Ex: "Notificações enviadas a observadores"]

**Cenário Principal**:
1. Usuário visualiza detalhes da tarefa
2. Usuário clica no campo "Estado"
3. Sistema exibe dropdown com estados permitidos (baseado em transições válidas)
4. Usuário seleciona novo estado
5. Sistema valida transição (conforme glossário)
6. Sistema atualiza estado
7. Sistema registra mudança no histórico
8. Sistema envia notificações
9. Sistema exibe mensagem de sucesso

**Cenários Alternativos**:

- **5a. Transição inválida**:
  - 5a1. Sistema exibe mensagem: "Transição não permitida de [Estado Atual] para [Estado Selecionado]"
  - 5a2. Sistema sugere estados válidos
  - 5a3. Retorna ao passo 4

- **6a. Tarefa sendo modificada por outro usuário (conflito)**:
  - 6a1. Sistema detecta versão desatualizada
  - 6a2. Sistema exibe mensagem: "Tarefa foi modificada por [Usuário]. Recarregue a página."
  - 6a3. Sistema oferece opção de "Forçar Atualização" (apenas admins)

**Cenários de Exceção**:
- [Similar ao UC-001]

**Requisitos Não-Funcionais Relacionados**:
- **Performance**: Atualização deve completar em < 200ms (p95)
- **Concorrência**: Sistema deve prevenir race conditions com locking otimista

**Regras de Negócio Aplicáveis**:
- Estados e transições válidas (ver glossário)

**Cenários BDD Relacionados**:
- `@ID-010` em `features/tasks.feature`: "Atualizar tarefa para Em Progresso"
- `@ID-011` em `features/tasks.feature`: "Validar transição inválida"

**Prioridade**: Alta  
**Complexidade**: Média  
**Risco**: Médio

---

### UC-003: [Adicione mais casos de uso conforme necessário]

[Repita a estrutura acima para cada caso de uso]

---

## Mapa de Navegação

### Fluxo Principal: Gestão de Tarefas

```
[Desenvolvedor]
    │
    ├─► UC-001: Criar Tarefa
    │       │
    │       └─► UC-002: Atualizar Estado
    │               │
    │               └─► UC-007: Concluir Tarefa
    │
    ├─► UC-003: Visualizar Tarefas Atribuídas
    │       │
    │       └─► UC-004: Filtrar e Buscar Tarefas
    │
    └─► UC-011: Receber Notificações
            │
            └─► UC-002: Atualizar Estado (reativo)
```

### Fluxo Secundário: Gestão de Projetos

```
[Product Owner]
    │
    ├─► UC-005: Criar Projeto
    │       │
    │       └─► UC-006: Configurar Integrações
    │
    ├─► UC-008: Priorizar Tarefas (Backlog)
    │
    └─► UC-009: Visualizar Métricas de Projeto
```

### Fluxo de Integrações

```
[Sistema GitHub] ◄──► UC-010: Sincronizar Issues
                          │
                          └─► UC-001: Criar Tarefa (automático)
```

---

## Matriz de Rastreabilidade

| Caso de Uso | Atores | Requisitos Funcionais | Cenários BDD | Prioridade |
|-------------|--------|-----------------------|--------------|------------|
| UC-001 | Desenvolvedor | FR-001, FR-002 | @ID-001, @ID-002, @ID-003 | Alta |
| UC-002 | Dev, PO | FR-003 | @ID-010, @ID-011 | Alta |
| UC-003 | Desenvolvedor | FR-004, FR-005 | @ID-020, @ID-021 | Alta |
| UC-004 | Dev, PO, Obs | FR-006 | @ID-030 | Média |
| UC-005 | PO | FR-007, FR-008 | @ID-040, @ID-041 | Alta |
| UC-006 | PO, Admin | FR-009 | @ID-050 | Média |
| UC-007 | Desenvolvedor | FR-003, FR-010 | @ID-060 | Alta |
| UC-008 | PO | FR-011 | @ID-070 | Média |
| UC-009 | PO, Obs | FR-012, FR-013 | @ID-080 | Baixa |
| UC-010 | GitHub | FR-014 | @ID-090 | Média |
| UC-011 | Todos | FR-015 | @ID-100 | Alta |

---

## Histórico de Revisões

| Versão | Data | Autor | Mudanças Principais |
|--------|------|-------|---------------------|
| 1.0 | [DATA] | [NOME] | Versão inicial |
| 1.1 | [DATA] | [NOME] | Adicionados UC-009 e UC-010 |
| 1.2 | [DATA] | [NOME] | Refinados fluxos alternativos de UC-001 |

---

## Validação

### Checklist de Qualidade

- [ ] Todos os atores primários identificados
- [ ] Todos os atores secundários (sistemas externos) identificados
- [ ] Cada caso de uso tem ao menos um cenário BDD correspondente
- [ ] Pré e pós-condições claramente definidas
- [ ] Fluxos alternativos e exceções documentados
- [ ] Transições de estado consistentes com `glossario.md`
- [ ] Requisitos funcionais rastreáveis
- [ ] Prioridades definidas

---

**Nota**: Este documento deve estar alinhado com:
- `visao-escopo.md` (stakeholders e objetivos)
- `glossario.md` (termos e regras de negócio)
- `features/*.feature` (cenários BDD executáveis)

**Próximos Passos**:
1. Criar cenários BDD correspondentes em `features/tasks.feature`
2. Validar com stakeholders
3. Refinar complexidade e estimativas
4. Priorizar casos de uso para implementação