# ADR-[NNN]: [Título da Decisão]

**Status**: [Proposta | Aceita | Rejeitada | Substituída por ADR-XXX | Depreciada]  
**Data**: [YYYY-MM-DD]  
**Decisores**: [Nomes/Papéis das pessoas envolvidas]  
**Tags**: [arquitetura, backend, frontend, infra, segurança, performance, etc.]  
**Impacto**: [Baixo | Médio | Alto]

---

## Contexto

### Problema

[Descreva o problema ou oportunidade que motivou esta decisão. Seja específico sobre:]
- Qual situação ou requisito gerou a necessidade dessa decisão?
- Quais são as restrições técnicas, de negócio ou de prazo?
- Qual é o impacto de não tomar uma decisão?

**Exemplo**:
> Atualmente, o sistema processa requisições de forma síncrona, resultando em timeouts quando APIs externas demoram mais de 30 segundos para responder. Com o crescimento esperado de 5x no volume de requisições, precisamos de uma solução que permita processamento assíncrono e retry automático.

### Forças (Forces)

Fatores que influenciam a decisão:

**Técnicos**:
- [Ex: "Stack atual é Python/FastAPI; equipe tem pouca experiência com Go"]
- [Ex: "Infraestrutura atual é AWS; migrações são custosas"]
- [Ex: "Sistema deve suportar 10k req/s com latência p95 < 200ms"]

**Negócio**:
- [Ex: "Prazo de 3 meses para MVP"]
- [Ex: "Orçamento limitado a $50k para infraestrutura no primeiro ano"]
- [Ex: "Cliente exige conformidade SOC 2"]

**Equipe**:
- [Ex: "Time de 3 desenvolvedores, apenas 1 com experiência em sistemas distribuídos"]
- [Ex: "Preferência por soluções managed para reduzir ops overhead"]

**Restrições**:
- [Ex: "Deve ser compatível com PostgreSQL 14+ existente"]
- [Ex: "Não pode requerer mudanças no frontend (já em produção)"]

---

## Decisão

[Descreva a decisão tomada de forma clara, inequívoca e acionável.]

**Exemplo**:
> Implementaremos um sistema de filas assíncronas usando AWS SQS + Lambda para processar requisições pesadas. Requisições síncronas retornarão imediatamente um job ID, e o cliente poderá polling status via endpoint `/jobs/{id}`.

### Abordagem Técnica

[Detalhe como a decisão será implementada:]

**Componentes**:
- [Ex: "API Gateway → Lambda (enqueue) → SQS → Lambda (worker) → PostgreSQL"]
- [Ex: "Redis para cache de status de jobs (TTL 24h)"]

**Interfaces**:
- `POST /api/tasks` → Retorna `{ "job_id": "uuid", "status": "pending" }`
- `GET /api/jobs/{job_id}` → Retorna `{ "status": "pending|processing|completed|failed", "result": {...} }`

**Fluxo**:
1. Cliente envia requisição pesada via POST
2. API valida input e cria job no banco
3. API enfileira mensagem no SQS
4. API retorna job_id imediatamente (< 100ms)
5. Lambda worker processa job assincronamente
6. Worker atualiza status no banco e cache (Redis)
7. Cliente faz polling de status a cada 2 segundos

---

## Consequências

### Positivas ✅

- **[Benefício 1]**: [Ex: "Eliminação de timeouts; sistema responde sempre em < 100ms"]
  - **Impacto**: [Ex: "Melhora experiência do usuário; reduz tickets de suporte"]
  
- **[Benefício 2]**: [Ex: "Escalabilidade horizontal automática via Lambda"]
  - **Impacto**: [Ex: "Suporta picos de carga sem intervenção manual"]

- **[Benefício 3]**: [Ex: "Retry automático via SQS dead-letter queue"]
  - **Impacto**: [Ex: "Aumenta resiliência; reduz falhas transientes"]

- **[Benefício 4]**: [Ex: "Custos menores que manter workers sempre ativos"]
  - **Impacto**: [Ex: "Economia de ~$2k/mês vs EC2 sempre ligado"]

### Negativas ⚠️

- **[Trade-off 1]**: [Ex: "Latência total aumenta (assíncrono vs síncrono)"]
  - **Impacto**: [Ex: "Usuário aguarda 5-30s para resultado final vs 1-30s antes"]
  - **Mitigação**: [Ex: "Implementar WebSocket para notificação push (fase 2)"]

- **[Trade-off 2]**: [Ex: "Complexidade operacional (mais componentes)"]
  - **Impacto**: [Ex: "Debugging fica mais difícil; logs distribuídos"]
  - **Mitigação**: [Ex: "Implementar distributed tracing (OpenTelemetry)"]

- **[Trade-off 3]**: [Ex: "Dependência de serviços AWS (vendor lock-in)"]
  - **Impacto**: [Ex: "Migração futura para outro cloud é custosa"]
  - **Mitigação**: [Ex: "Abstrair filas via interface; trocar implementação se necessário"]

### Riscos 🚨

- **[Risco 1]**: [Ex: "Limites de Lambda (15 min timeout, 10GB memory)"]
  - **Probabilidade**: [Alta | Média | Baixa]
  - **Impacto**: [Alto | Médio | Baixo]
  - **Mitigação**: [Ex: "Particionar jobs grandes em subjobs; Fargate para jobs > 15min"]

- **[Risco 2]**: [Ex: "Custos inesperados se volume crescer muito rápido"]
  - **Probabilidade**: [Média]
  - **Impacto**: [Médio]
  - **Mitigação**: [Ex: "CloudWatch alarms para custos > $5k/mês; rate limiting"]

- **[Risco 3]**: [Ex: "Redis como SPOF se ficar indisponível"]
  - **Probabilidade**: [Baixa]
  - **Impacto**: [Médio]
  - **Mitigação**: [Ex: "Fallback para leitura direta do banco; cluster Redis multi-AZ"]

---

## Alternativas Consideradas

### Alternativa 1: [Nome da Alternativa - Ex: Workers com Celery + RabbitMQ]

**Descrição**:
[Ex: "Usar Celery (Python) com RabbitMQ como broker, rodando em EC2 com auto-scaling."]

**Prós**:
- [Ex: "Solução madura e bem documentada"]
- [Ex: "Controle total sobre workers (não há limites como Lambda)"]
- [Ex: "Multi-cloud (não depende de AWS)"]

**Contras**:
- [Ex: "Requer gerenciar infraestrutura (EC2, RabbitMQ, auto-scaling)"]
- [Ex: "Custos fixos mais altos (VMs sempre ligadas)"]
- [Ex: "Time não tem experiência com RabbitMQ operacional"]

**Por que foi rejeitada**:
[Ex: "Overhead operacional muito alto para um time pequeno (3 devs). Custos fixos não justificam para MVP. Preferimos solução serverless com menos ops."]

---

### Alternativa 2: [Nome da Alternativa - Ex: Processamento Síncrono com Timeout Aumentado]

**Descrição**:
[Ex: "Aumentar timeout de 30s para 5 minutos e melhorar performance das APIs externas."]

**Prós**:
- [Ex: "Sem mudança de arquitetura; implementação mais simples"]
- [Ex: "Sem complexidade de polling ou estado de jobs"]

**Contras**:
- [Ex: "Não resolve problema de escalabilidade (conexões HTTP abertas por 5 min)"]
- [Ex: "ALB/API Gateway tem limites de timeout (30-60s dependendo do serviço)"]
- [Ex: "Má experiência do usuário (navegador travado por 5 min)"]

**Por que foi rejeitada**:
[Ex: "Não é uma solução sustentável. Timeouts ainda ocorreriam. Não escala para volume esperado."]

---

### Alternativa 3: [Nome da Alternativa - Ex: Webhook Callbacks]

**Descrição**:
[Ex: "Cliente fornece webhook URL ao criar job; sistema notifica via POST quando job completa."]

**Prós**:
- [Ex: "Eliminação de polling; mais eficiente"]
- [Ex: "Cliente recebe notificação imediata"]

**Contras**:
- [Ex: "Requer cliente implementar endpoint de webhook (complexidade para usuário)"]
- [Ex: "Problemas com firewalls/NAT de clientes corporativos"]
- [Ex: "Retry lógica de webhook adiciona complexidade"]

**Por que foi rejeitada**:
[Ex: "Muitos clientes não podem expor endpoints públicos. Polling é mais simples para MVP. Webhook pode ser adicionado como feature opcional no futuro."]

---

## Implicações

### Mudanças Requeridas

**Código**:
- [ ] Criar endpoint `POST /api/tasks` com enfileiramento
- [ ] Criar endpoint `GET /api/jobs/{id}` para polling
- [ ] Implementar Lambda worker para processar jobs
- [ ] Adicionar Redis client para cache de status

**Infraestrutura**:
- [ ] Provisionar SQS queue (standard)
- [ ] Provisionar SQS dead-letter queue
- [ ] Provisionar ElastiCache Redis cluster
- [ ] Configurar Lambda com SQS trigger
- [ ] Configurar CloudWatch alarms

**Dados**:
- [ ] Criar tabela `jobs` (job_id, status, created_at, updated_at, result, error)
- [ ] Adicionar índice em `jobs.status` para queries
- [ ] Criar política de retenção (deletar jobs > 7 dias)

**Documentação**:
- [ ] Atualizar API docs com novos endpoints
- [ ] Criar guia de integração (polling best practices)
- [ ] Documentar códigos de erro e retry strategy

**Testes**:
- [ ] Testes de contrato para endpoints assíncronos
- [ ] Testes de carga (10k req/s)
- [ ] Testes de chaos (SQS indisponível, Lambda timeout)

### Impacto em Outros Componentes

| Componente | Impacto | Ação Necessária |
|------------|---------|-----------------|
| **Frontend** | Alto | Implementar polling UI; loading states; error handling |
| **Monitoramento** | Médio | Adicionar métricas (queue depth, Lambda duration, failure rate) |
| **Autenticação** | Baixo | Job polling requer mesma autenticação (JWT) |
| **Billing** | Médio | Considerar custos de Lambda invocations e SQS mensagens |

### Timeline

| Fase | Duração | Responsável |
|------|---------|-------------|
| Spike técnico (prova de conceito) | 1 semana | [Nome] |
| Implementação backend | 2 semanas | [Nome] |
| Implementação frontend | 1 semana | [Nome] |
| Testes e validação | 1 semana | Time |
| Deploy em staging | 1 dia | DevOps |
| Monitoramento e ajustes | 1 semana | Time |
| Deploy em produção | 1 dia | DevOps |

**Total estimado**: 7-8 semanas

---

## Referências

### Documentos Relacionados

- [Link para spike de prova de conceito]
- [Link para pesquisa de alternativas]
- [Link para benchmarks de performance]
- ADR-XXX: [Decisão relacionada anterior]
- RFC-YYY: [Proposta de mudança relacionada]

### Recursos Externos

- [AWS SQS Best Practices](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/best-practices.html)
- [Lambda Performance Tuning](https://aws.amazon.com/blogs/compute/performance-tuning/)
- [Artigo: "Patterns for Async Job Processing"](https://example.com/async-patterns)
- [Paper: "Idempotency in Distributed Systems"](https://example.com/idempotency)

### Benchmarks

| Métrica | Antes | Depois (Esperado) |
|---------|-------|-------------------|
| Latência p95 (sync) | 25s | 80ms (enqueue) |
| Latência total p95 | 25s | 12s (total assíncrono) |
| Taxa de timeout | 15% | 0% |
| Throughput máximo | 500 req/s | 10k req/s |
| Custo mensal ($) | $3,500 | $1,200 (estimado) |

---

## Aprovações

### Aprovadores Necessários

- [ ] **Tech Lead**: [Nome] — Assinatura: __________ Data: __________
- [ ] **Architect**: [Nome] — Assinatura: __________ Data: __________
- [ ] **DevOps Lead**: [Nome] — Assinatura: __________ Data: __________
- [ ] **Product Owner**: [Nome] — Assinatura: __________ Data: __________ (se impacta UX)

### Histórico de Revisões

| Versão | Data | Autor | Mudanças |
|--------|------|-------|----------|
| 1.0 | [DATA] | [NOME] | Proposta inicial |
| 1.1 | [DATA] | [NOME] | Adicionada alternativa 3 (webhooks) |
| 2.0 | [DATA] | [NOME] | Aprovada; refinado timeline |

---

## Lições Aprendidas (Post-Implementation)

[Seção a ser preenchida após implementação]

### O que funcionou bem
- [Ex: "SQS se mostrou extremamente confiável; zero mensagens perdidas"]
- [Ex: "Lambda auto-scaling funcionou perfeitamente; sem intervenção manual"]

### O que não funcionou como esperado
- [Ex: "Redis teve alguns timeouts durante picos; precisamos aumentar memory"]
- [Ex: "Custos foram 30% maiores que estimado devido a retries excessivos"]

### Mudanças Feitas Pós-Decisão
- [Ex: "Adicionamos circuit breaker para APIs externas (não previsto na decisão original)"]
- [Ex: "Mudamos de polling a cada 2s para 5s para reduzir custos"]

### Recomendações para Decisões Futuras
- [Ex: "Sempre incluir spike de 1 semana para validar custos reais"]
- [Ex: "Considerar WebSocket desde o início se latência total for crítica"]

---

**Nota**: Este ADR deve ser tratado como um documento vivo durante a fase de implementação. Atualize as seções de "Lições Aprendidas" e "Mudanças Feitas" conforme o projeto evolui.

**Próximos Passos**:
1. Criar spike técnico (prova de conceito)
2. Validar premissas de custo e performance
3. Refinar implementação baseado em resultados do spike
4. Atualizar este ADR se decisões significativas mudarem