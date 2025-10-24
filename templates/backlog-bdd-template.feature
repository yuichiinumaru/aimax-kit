# language: pt
Funcionalidade: [Nome da Feature - Ex: Gestão de Tarefas]

  Como [ator/papel - ex: Desenvolvedor]
  Quero [objetivo - ex: gerenciar minhas tarefas de forma eficiente]
  Para que [benefício/valor - ex: eu possa acompanhar meu trabalho e priorizar atividades]

  # Contexto compartilhado por todos os cenários desta feature
  Contexto:
    Dado que eu sou um usuário autenticado
    E eu sou membro do projeto "Website Redesign"
    E o projeto está no estado "Ativo"

  # ============================================================================
  # CENÁRIOS DE ALTA PRIORIDADE
  # ============================================================================

  @prioridade-alta @ID-001 @smoke
  Cenário: Criar tarefa com campos mínimos
    Dado que eu estou na página do projeto "Website Redesign"
    Quando eu clico no botão "Nova Tarefa"
    E eu preencho o campo "Título" com "Implementar header responsivo"
    E eu clico no botão "Criar"
    Então eu devo ver a mensagem "Tarefa criada com sucesso"
    E a tarefa "Implementar header responsivo" deve estar no estado "Nova"
    E a tarefa deve ter um ID único
    E a tarefa deve ter timestamp de criação
    E eu devo ser redirecionado para a página de detalhes da tarefa

  @prioridade-alta @ID-002 @integracao
  Cenário: Criar tarefa com todos os campos preenchidos
    Dado que eu estou na página do projeto "Website Redesign"
    Quando eu clico no botão "Nova Tarefa"
    E eu preencho os seguintes campos:
      | Campo       | Valor                          |
      | Título      | Implementar header responsivo  |
      | Descrição   | Header deve adaptar para mobile|
      | Prioridade  | Alta                           |
      | Responsável | João Silva                     |
      | Prazo       | 2025-02-15                     |
    E eu clico no botão "Criar"
    Então eu devo ver a mensagem "Tarefa criada com sucesso"
    E a tarefa deve ter os seguintes atributos:
      | Atributo    | Valor Esperado                 |
      | Título      | Implementar header responsivo  |
      | Estado      | Nova                           |
      | Prioridade  | Alta                           |
      | Responsável | João Silva                     |
      | Prazo       | 2025-02-15                     |
    E João Silva deve receber uma notificação de atribuição

  @prioridade-alta @ID-003 @validacao
  Cenário: Validação de campos obrigatórios ao criar tarefa
    Dado que eu estou na página do projeto "Website Redesign"
    Quando eu clico no botão "Nova Tarefa"
    E eu deixo o campo "Título" vazio
    E eu clico no botão "Criar"
    Então eu devo ver a mensagem de erro "Título é obrigatório"
    E o formulário deve permanecer aberto
    E os dados já preenchidos devem ser mantidos

  @prioridade-alta @ID-004
  Cenário: Atualizar estado de tarefa para Em Progresso
    Dado que existe uma tarefa "Implementar header" no estado "Nova"
    E eu sou o responsável pela tarefa
    Quando eu acesso a página de detalhes da tarefa
    E eu clico no campo "Estado"
    E eu seleciono "Em Progresso"
    Então o estado da tarefa deve ser "Em Progresso"
    E o timestamp de "Última Atualização" deve ser registrado
    E o histórico deve mostrar a mudança de estado
    E observadores devem receber notificação da mudança

  @prioridade-alta @ID-005 @validacao
  Cenário: Validar transição inválida de estado
    Dado que existe uma tarefa no estado "Nova"
    Quando eu tento mudar o estado para "Concluída" diretamente
    Então eu devo ver a mensagem "Transição não permitida de Nova para Concluída"
    E o sistema deve sugerir os estados válidos: "Em Progresso"
    E o estado da tarefa deve permanecer "Nova"

  # ============================================================================
  # CENÁRIOS DE MÉDIA PRIORIDADE
  # ============================================================================

  @prioridade-media @ID-010
  Cenário: Filtrar tarefas por estado
    Dado que existem as seguintes tarefas no projeto:
      | Título     | Estado       |
      | Tarefa A   | Nova         |
      | Tarefa B   | Em Progresso |
      | Tarefa C   | Concluída    |
      | Tarefa D   | Em Progresso |
    Quando eu aplico o filtro "Estado = Em Progresso"
    Então eu devo ver apenas as tarefas:
      | Título   |
      | Tarefa B |
      | Tarefa D |

  @prioridade-media @ID-011
  Cenário: Buscar tarefas por título
    Dado que existem tarefas com títulos contendo "header"
    Quando eu digito "header" no campo de busca
    E eu pressiono Enter
    Então eu devo ver apenas tarefas cujo título contém "header"
    E os resultados devem ser ordenados por relevância

  @prioridade-media @ID-012 @notificacoes
  Cenário: Receber notificação quando mencionado em comentário
    Dado que eu sou membro do projeto
    E existe uma tarefa "Implementar feature X"
    Quando João Silva adiciona o comentário "@maria preciso da sua ajuda aqui"
    E meu nome de usuário é "maria"
    Então eu devo receber uma notificação do tipo "Menção"
    E a notificação deve conter o link para a tarefa
    E a notificação deve mostrar o comentário completo

  # ============================================================================
  # CENÁRIOS DE BAIXA PRIORIDADE
  # ============================================================================

  @prioridade-baixa @ID-020 @metricas
  Cenário: Visualizar métricas básicas do projeto
    Dado que eu sou Product Owner do projeto "Website Redesign"
    E o projeto tem as seguintes tarefas:
      | Estado       | Quantidade |
      | Nova         | 5          |
      | Em Progresso | 3          |
      | Concluída    | 12         |
    Quando eu acesso a página de métricas do projeto
    Então eu devo ver o total de tarefas: 20
    E eu devo ver a taxa de conclusão: 60%
    E eu devo ver a distribuição por estado em gráfico

  # ============================================================================
  # CENÁRIOS DE EDGE CASES
  # ============================================================================

  @prioridade-alta @ID-030 @edge-case
  Cenário: Tentar criar tarefa sem permissão
    Dado que eu sou um Observador (somente leitura)
    E eu estou na página do projeto "Website Redesign"
    Quando eu tento acessar o formulário de criação de tarefa
    Então o botão "Nova Tarefa" deve estar desabilitado
    E eu devo ver a mensagem "Você não tem permissão para criar tarefas"

  @prioridade-media @ID-031 @edge-case @concorrencia
  Cenário: Conflito ao atualizar tarefa modificada por outro usuário
    Dado que eu estou visualizando a tarefa #123
    E outro usuário modifica a tarefa enquanto eu a visualizo
    Quando eu tento atualizar o estado da tarefa
    Então eu devo ver a mensagem "Tarefa foi modificada por [Usuário]. Recarregue a página."
    E minhas mudanças não devem ser aplicadas
    E eu devo ter a opção de "Recarregar Página"

  @prioridade-baixa @ID-032 @edge-case
  Cenário: Criar tarefa com título muito longo
    Dado que eu estou no formulário de criação de tarefa
    Quando eu preencho o campo "Título" com mais de 255 caracteres
    E eu clico no botão "Criar"
    Então eu devo ver a mensagem "Título não pode ter mais de 255 caracteres"
    E a tarefa não deve ser criada

  # ============================================================================
  # CENÁRIOS COM INTEGRAÇÕES EXTERNAS
  # ============================================================================

  @prioridade-media @ID-040 @integracao-github
  Cenário: Criar tarefa vinculada a issue do GitHub
    Dado que a integração com GitHub está habilitada
    E eu estou no formulário de criação de tarefa
    Quando eu preencho o título "Implementar header"
    E eu marco a opção "Criar issue no GitHub"
    E eu clico no botão "Criar"
    Então a tarefa deve ser criada no sistema
    E uma issue deve ser criada no GitHub via API
    E a tarefa deve estar vinculada à issue do GitHub
    E a tarefa deve mostrar o link para a issue

  @prioridade-media @ID-041 @integracao-github @webhook
  Cenário: Sincronizar estado quando issue é fechada no GitHub
    Dado que existe uma tarefa vinculada à issue #456 do GitHub
    E a tarefa está no estado "Em Progresso"
    Quando a issue #456 é fechada no GitHub
    E o webhook é recebido pelo sistema
    Então a tarefa deve automaticamente mudar para "Concluída"
    E um comentário automático deve ser adicionado: "Issue fechada no GitHub"
    E o responsável deve receber notificação

  # ============================================================================
  # CENÁRIOS COM ESQUEMA (Data-Driven)
  # ============================================================================

  @prioridade-media @ID-050
  Esquema do Cenário: Validar transições de estado válidas
    Dado que existe uma tarefa no estado "<estado_inicial>"
    Quando eu tento mudar o estado para "<estado_final>"
    Então a transição deve ser "<resultado>"

    Exemplos:
      | estado_inicial | estado_final  | resultado   |
      | Nova           | Em Progresso  | Permitida   |
      | Em Progresso   | Bloqueada     | Permitida   |
      | Em Progresso   | Em Revisão    | Permitida   |
      | Em Revisão     | Concluída     | Permitida   |
      | Em Revisão     | Em Progresso  | Permitida   |
      | Concluída      | Arquivada     | Permitida   |
      | Nova           | Concluída     | Negada      |
      | Arquivada      | Em Progresso  | Negada      |
      | Concluída      | Nova          | Negada      |

  @prioridade-baixa @ID-051
  Esquema do Cenário: Validar prioridades de tarefa
    Dado que eu crio uma tarefa com prioridade "<prioridade>"
    Então a cor do indicador visual deve ser "<cor>"
    E a ordenação padrão deve colocar esta tarefa na posição "<ordem>"

    Exemplos:
      | prioridade | cor      | ordem   |
      | Alta       | Vermelho | Topo    |
      | Média      | Amarelo  | Meio    |
      | Baixa      | Verde    | Final   |

  # ============================================================================
  # CENÁRIOS DE PERFORMANCE E CARGA
  # ============================================================================

  @prioridade-alta @ID-060 @performance
  Cenário: Criar tarefa deve responder em tempo aceitável
    Dado que o sistema está sob carga normal
    Quando eu crio uma nova tarefa
    Então a operação deve completar em menos de 500ms (p95)
    E a resposta HTTP deve ter status 201 Created

  @prioridade-media @ID-061 @performance
  Cenário: Listar tarefas de projeto grande deve ser eficiente
    Dado que o projeto tem mais de 1000 tarefas
    Quando eu acesso a lista de tarefas
    Então a página deve carregar em menos de 2 segundos
    E os resultados devem ser paginados (50 itens por página)
    E a interface deve permanecer responsiva

  # ============================================================================
  # CENÁRIOS DE SEGURANÇA
  # ============================================================================

  @prioridade-alta @ID-070 @seguranca
  Cenário: Impedir acesso a tarefas de projetos sem permissão
    Dado que eu não sou membro do projeto "Projeto Confidencial"
    Quando eu tento acessar diretamente a URL da tarefa "/tasks/789"
    Então eu devo receber erro HTTP 403 Forbidden
    E eu devo ver a mensagem "Você não tem acesso a este recurso"

  @prioridade-alta @ID-071 @seguranca @sql-injection
  Cenário: Proteger contra SQL injection no campo de busca
    Dado que eu estou na página de busca de tarefas
    Quando eu digito "'; DROP TABLE tasks; --" no campo de busca
    Então o sistema deve escapar caracteres especiais
    E nenhuma query SQL maliciosa deve ser executada
    E o sistema deve retornar "Nenhuma tarefa encontrada"

  # ============================================================================
  # TAGS UTILIZADAS (Referência)
  # ============================================================================

  # @prioridade-alta      - Funcionalidade crítica para MVP
  # @prioridade-media     - Importante mas não bloqueante
  # @prioridade-baixa     - Nice to have
  # @smoke                - Teste de fumaça (crítico para deploy)
  # @integracao           - Testa integração entre componentes
  # @validacao            - Testa validações de input
  # @edge-case            - Casos extremos e situações raras
  # @performance          - Testa requisitos de performance
  # @seguranca            - Testa requisitos de segurança
  # @concorrencia         - Testa cenários multi-usuário
  # @notificacoes         - Testa sistema de notificações
  # @metricas             - Testa dashboards e relatórios
  # @integracao-github    - Testa integração específica com GitHub
  # @webhook              - Testa webhooks de sistemas externos
  # @sql-injection        - Testa proteção contra SQL injection
  # @ID-XXX               - Identificador único para rastreabilidade
