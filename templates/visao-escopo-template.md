# Visão e Escopo — [NOME DO PROJETO]

**Criado**: [DATA]  
**Última Atualização**: [DATA]  
**Status**: [Draft | Em Revisão | Aprovado]  
**Versão**: 1.0

---

## 1. Visão do Produto

### 1.1 Declaração de Visão

[Descreva em 2-3 parágrafos o que é o produto/sistema, por que ele existe e qual problema ele resolve. Seja específico sobre o valor entregue.]

**Exemplo**:
> O Sistema XYZ é uma plataforma de gerenciamento de projetos que permite equipes distribuídas colaborarem em tempo real, com foco em simplicidade e visibilidade. Ele resolve o problema de coordenação assíncrona que afeta equipes remotas, reduzindo reuniões desnecessárias e centralizando informações críticas.

### 1.2 Posicionamento

- **Para**: [público-alvo, ex: "equipes de desenvolvimento de software de 5-50 pessoas"]
- **Que**: [necessidade ou oportunidade, ex: "precisam coordenar trabalho assíncrono eficientemente"]
- **O [nome do produto]**: [categoria do produto, ex: "é uma ferramenta de gestão de projetos"]
- **Que**: [principal benefício, ex: "centraliza comunicação e elimina overhead de reuniões"]
- **Diferente de**: [alternativas principais, ex: "Jira, Trello, Asana"]
- **Nosso produto**: [diferenciador-chave, ex: "é focado em assincronicidade e autonomia de equipe"]

---

## 2. Objetivos de Negócio

### 2.1 Objetivos Primários

- **OBJ-001**: [Objetivo mensurável, ex: "Reduzir tempo de onboarding de novos membros em 50%"]
  - **Métrica**: [Como medir, ex: "Tempo médio até primeiro commit produtivo"]
  - **Meta**: [Valor alvo, ex: "De 5 dias para 2.5 dias"]
  - **Prazo**: [Quando, ex: "Q2 2025"]

- **OBJ-002**: [Objetivo mensurável, ex: "Aumentar retenção de usuários em 30%"]
  - **Métrica**: [Como medir, ex: "Taxa de retenção mensal (MRR)"]
  - **Meta**: [Valor alvo, ex: "De 70% para 91%"]
  - **Prazo**: [Quando, ex: "Q3 2025"]

- **OBJ-003**: [Objetivo mensurável, ex: "Atingir 10k usuários ativos mensais"]
  - **Métrica**: [Como medir, ex: "MAU (Monthly Active Users)"]
  - **Meta**: [Valor alvo, ex: "10,000 MAU"]
  - **Prazo**: [Quando, ex: "Q4 2025"]

### 2.2 Objetivos Secundários

- [Objetivos de suporte, ex: "Estabelecer presença em 3 novos mercados"]
- [Objetivos de suporte, ex: "Reduzir custos operacionais em 20%"]

---

## 3. Escopo do Produto

### 3.1 In Scope (Incluído)

#### 3.1.1 Funcionalidades Principais

- **F-001**: [Funcionalidade incluída, ex: "Criação e gestão de tarefas com estados customizáveis"]
  - **Justificativa**: [Por que é essencial]
  - **Prioridade**: [Alta | Média | Baixa]

- **F-002**: [Funcionalidade incluída, ex: "Sistema de notificações assíncronas (não em tempo real)"]
  - **Justificativa**: [Por que é essencial]
  - **Prioridade**: [Alta | Média | Baixa]

- **F-003**: [Funcionalidade incluída, ex: "Integração com GitHub/GitLab via webhooks"]
  - **Justificativa**: [Por que é essencial]
  - **Prioridade**: [Alta | Média | Baixa]

#### 3.1.2 Integrações

- [Sistema/Serviço a integrar, ex: "GitHub API (leitura de PRs e issues)"]
- [Sistema/Serviço a integrar, ex: "Slack (notificações opcionais)"]

#### 3.1.3 Plataformas

- [Plataforma suportada, ex: "Web (desktop e mobile responsivo)"]
- [Plataforma suportada, ex: "API REST para integrações"]

### 3.2 Out of Scope (Excluído)

#### 3.2.1 Funcionalidades Explicitamente Excluídas

- **X-001**: [Funcionalidade excluída, ex: "Chat em tempo real integrado"]
  - **Razão**: [Por que não será incluído, ex: "Fora do foco de assincronicidade; existem ferramentas melhores (Slack, Discord)"]
  - **Alternativa**: [Se houver, ex: "Integração com Slack para quem precisa"]

- **X-002**: [Funcionalidade excluída, ex: "Aplicativo mobile nativo (iOS/Android)"]
  - **Razão**: [Por que não será incluído, ex: "Custo/benefício baixo; web responsivo atende 95% dos casos"]
  - **Alternativa**: [Se houver, ex: "PWA (Progressive Web App) no futuro"]

- **X-003**: [Funcionalidade excluída, ex: "Controle de ponto/timesheet automático"]
  - **Razão**: [Por que não será incluído, ex: "Foge do core; micromanagement não é nosso foco"]
  - **Alternativa**: [Se houver, ex: "Integração com Toggl/Clockify"]

#### 3.2.2 Limites Técnicos

- [Limite explícito, ex: "Não suportará IE11 ou navegadores legacy"]
- [Limite explícito, ex: "Máximo de 1000 tarefas ativas por projeto (MVP)"]

---

## 4. Stakeholders

### 4.1 Stakeholders Principais

| Papel | Nome/Grupo | Necessidades Principais | Influência | Interesse |
|-------|------------|-------------------------|------------|-----------|
| **Product Owner** | [Nome] | Alinhamento com roadmap, ROI | Alta | Alto |
| **Tech Lead** | [Nome] | Viabilidade técnica, qualidade | Alta | Alto |
| **Usuário Final** | Desenvolvedores | Ferramenta rápida, não-intrusiva | Média | Alto |
| **Cliente/Sponsor** | [Nome/Empresa] | Prazo, custo, funcionalidades críticas | Alta | Médio |

### 4.2 Stakeholders Secundários

| Papel | Nome/Grupo | Necessidades Principais | Influência | Interesse |
|-------|------------|-------------------------|------------|-----------|
| **Suporte** | Time de CS | Facilidade de troubleshooting | Baixa | Médio |
| **Marketing** | Time de Marketing | Diferenciadores claros | Baixa | Médio |
| **Segurança** | Time de InfoSec | Conformidade, auditoria | Média | Baixo |

---

## 5. Restrições

### 5.1 Restrições Técnicas

- **RT-001**: [Restrição técnica, ex: "Deve rodar em Python 3.11+ (compatibilidade com infra existente)"]
- **RT-002**: [Restrição técnica, ex: "Deve usar PostgreSQL 14+ (padrão da empresa)"]
- **RT-003**: [Restrição técnica, ex: "Latência máxima de 200ms p95 para operações principais"]
- **RT-004**: [Restrição técnica, ex: "Deve ser deployável em containers Docker (Kubernetes)"]

### 5.2 Restrições Regulatórias e de Compliance

- **RR-001**: [Restrição regulatória, ex: "Conformidade GDPR (dados de usuários europeus)"]
- **RR-002**: [Restrição regulatória, ex: "SOC 2 Type II (exigência de clientes enterprise)"]
- **RR-003**: [Restrição regulatória, ex: "Logs de auditoria devem ser retidos por 7 anos"]

### 5.3 Restrições de Orçamento e Tempo

- **RO-001**: [Restrição orçamentária, ex: "Orçamento total: $150k (dev + infra + ops)"]
- **RO-002**: [Restrição temporal, ex: "MVP deve estar em produção em 3 meses"]
- **RO-003**: [Restrição de recursos, ex: "Time de 3 devs + 1 designer + 1 PM"]

### 5.4 Restrições de Equipe e Conhecimento

- **RE-001**: [Restrição de equipe, ex: "Time tem expertise em Python/FastAPI, não em Go ou Rust"]
- **RE-002**: [Restrição de equipe, ex: "Time não tem experiência com real-time (WebSockets)"]

---

## 6. Premissas (Assumptions)

### 6.1 Premissas de Negócio

- **P-001**: [Premissa, ex: "Usuários têm familiaridade com ferramentas de gerenciamento de projetos (ex: Jira, Trello)"]
- **P-002**: [Premissa, ex: "Clientes estão dispostos a pagar $10-15/usuário/mês"]
- **P-003**: [Premissa, ex: "Mercado de ferramentas de gestão está crescendo 15% ao ano"]

### 6.2 Premissas Técnicas

- **P-004**: [Premissa, ex: "GitHub/GitLab APIs permanecerão estáveis durante desenvolvimento"]
- **P-005**: [Premissa, ex: "Infraestrutura AWS/GCP estará disponível (uptime > 99.9%)"]
- **P-006**: [Premissa, ex: "Usuários têm conexão de internet razoável (> 1 Mbps)"]

### 6.3 Premissas de Equipe

- **P-007**: [Premissa, ex: "Time permanecerá estável durante os 3 meses de desenvolvimento"]
- **P-008**: [Premissa, ex: "Tech Lead estará disponível para revisões de arquitetura semanalmente"]

---

## 7. Dependências Externas

### 7.1 Dependências Críticas

- **D-001**: [Dependência, ex: "GitHub API (se GitHub cair, integração para)"]
  - **Risco**: [Alto | Médio | Baixo]
  - **Mitigação**: [ex: "Cache local de dados; fallback manual"]

- **D-002**: [Dependência, ex: "Serviço de e-mail (SendGrid/SES)"]
  - **Risco**: [Alto | Médio | Baixo]
  - **Mitigação**: [ex: "Queue de retry; múltiplos providers"]

### 7.2 Dependências Desejáveis (Não-Críticas)

- **D-003**: [Dependência, ex: "Integração com Slack (nice to have)"]
  - **Risco**: [Baixo]
  - **Mitigação**: [ex: "Feature é opcional"]

---

## 8. Riscos Iniciais

### 8.1 Riscos de Negócio

- **R-001**: [Risco, ex: "Competidores lançam features similares antes de nós"]
  - **Probabilidade**: [Alta | Média | Baixa]
  - **Impacto**: [Alto | Médio | Baixo]
  - **Mitigação**: [Estratégia, ex: "Focar em diferenciadores únicos; MVP rápido"]

- **R-002**: [Risco, ex: "Adoção mais lenta que o esperado"]
  - **Probabilidade**: [Média]
  - **Impacto**: [Alto]
  - **Mitigação**: [Estratégia, ex: "Programa de early adopters; onboarding guiado"]

### 8.2 Riscos Técnicos

- **R-003**: [Risco, ex: "Integração com GitHub mais complexa que o estimado"]
  - **Probabilidade**: [Média]
  - **Impacto**: [Médio]
  - **Mitigação**: [Estratégia, ex: "Spike de 1 semana antes do desenvolvimento principal"]

- **R-004**: [Risco, ex: "Performance não atende requisitos de latência"]
  - **Probabilidade**: [Baixa]
  - **Impacto**: [Alto]
  - **Mitigação**: [Estratégia, ex: "Testes de carga desde o início; profiling contínuo"]

### 8.3 Riscos de Equipe

- **R-005**: [Risco, ex: "Perda de membro-chave do time"]
  - **Probabilidade**: [Baixa]
  - **Impacto**: [Alto]
  - **Mitigação**: [Estratégia, ex: "Documentação contínua; pair programming; cross-training"]

---

## 9. Critérios de Sucesso

### 9.1 Critérios de Sucesso de Negócio

- **CS-001**: [Critério, ex: "1000 usuários ativos no primeiro mês pós-launch"]
- **CS-002**: [Critério, ex: "NPS (Net Promoter Score) > 40"]
- **CS-003**: [Critério, ex: "Taxa de conversão free→paid > 5%"]

### 9.2 Critérios de Sucesso Técnico

- **CS-004**: [Critério, ex: "Uptime > 99.5% no primeiro trimestre"]
- **CS-005**: [Critério, ex: "p95 de latência < 200ms em todas as operações principais"]
- **CS-006**: [Critério, ex: "Cobertura de testes > 85%"]

### 9.3 Critérios de Sucesso de Usuário

- **CS-007**: [Critério, ex: "Tempo médio de onboarding < 10 minutos"]
- **CS-008**: [Critério, ex: "Taxa de retenção D7 > 60%"]
- **CS-009**: [Critério, ex: "< 5% de tickets de suporte por usuário/mês"]

---

## 10. Aprovações

### 10.1 Histórico de Revisões

| Versão | Data | Autor | Mudanças Principais |
|--------|------|-------|---------------------|
| 1.0 | [DATA] | [NOME] | Versão inicial |
| 1.1 | [DATA] | [NOME] | Adicionadas restrições regulatórias |
| 1.2 | [DATA] | [NOME] | Escopo refinado após revisão com stakeholders |

### 10.2 Aprovações Necessárias

- [ ] **Product Owner**: [Nome] — Assinatura: __________ Data: __________
- [ ] **Tech Lead**: [Nome] — Assinatura: __________ Data: __________
- [ ] **Sponsor/Cliente**: [Nome] — Assinatura: __________ Data: __________
- [ ] **Compliance/Legal**: [Nome] — Assinatura: __________ Data: __________

---

## 11. Referências

### 11.1 Documentos Relacionados

- [Link para pesquisa de mercado]
- [Link para análise de competidores]
- [Link para entrevistas com usuários]
- [Link para `glossario.md`] (quando criado)
- [Link para `atores-casos-uso.md`] (quando criado)

### 11.2 Ferramentas e Frameworks

- [Referência a metodologias usadas, ex: "Design Thinking", "Lean Startup"]
- [Referência a frameworks, ex: "Jobs to be Done", "Value Proposition Canvas"]

---

**Nota**: Este documento de Visão e Escopo deve ser tratado como a **fonte da verdade** para o projeto. Qualquer mudança deve passar por processo de aprovação formal e atualizar este documento.

**Próximos Passos**:
1. Criar `glossario.md` com termos canônicos do domínio
2. Criar `atores-casos-uso.md` com detalhamento de interações
3. Criar `adr.md` para decisões arquiteturais
4. Criar `features/backlog-bdd.feature` com cenários executáveis