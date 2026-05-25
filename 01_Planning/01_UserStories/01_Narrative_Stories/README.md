# Narrative Stories — MiaCaoMigo Braga (May–June 2026)

Human-readable narratives drawn from the same launch simulation as [02_Operational_Scenarios](../02_Operational_Scenarios/).  
Master context: [00_ECOSYSTEM.md](../00_ECOSYSTEM.md) · Chronology: [TIMELINE_LAUNCH_2026.md](../02_Operational_Scenarios/01_Chronology/TIMELINE_LAUNCH_2026.md).

---

## Purpose of this layer

The operational folder documents **who did what, when, and under which rules** — appointment states, commercial events, absence codes, and cross-links for DemoData and QA. That material is precise and schematic by design.

**Narrative Stories** translate those facts into **coherent, readable accounts** of people, animals, and partner organisations. The goal is ecosystem understanding: roles, relationships, and the rhythm of the first operational weeks — not implementation detail.

| Layer | Audience question | Where |
|-------|---------------------|--------|
| **Narrative Stories** (here) | *Who are they, and how do their paths intersect?* | `01_Narrative_Stories/` |
| **Operational Scenarios** | *What exactly happened, and what must the system enforce?* | `02_Operational_Scenarios/` |

Operational validation, state names, and chronological indexes remain authoritative in **02_Operational_Scenarios**. If a narrative and an operational file differ, trust the operational file.

---

## Contents

### Customers

| Story | Focus |
|-------|--------|
| [CLI_GONCALO.md](Customers/CLI_GONCALO.md) | Gonçalo Rego — adoption anchor, repeat retail, multi-specialty care |
| [CLI_MARTA_RIBEIRO.md](Customers/CLI_MARTA_RIBEIRO.md) | Marta Ribeiro — returns, late visit, overdue invoice |
| [CLI_ANA_LOURENCO.md](Customers/CLI_ANA_LOURENCO.md) | Ana Lourenço — adoption, loss, future wellness visit |
| [CLI_PEDRO_COSTA.md](Customers/CLI_PEDRO_COSTA.md) | Pedro Costa — no-show, inactive account |

### Employees

| Story | Focus |
|-------|--------|
| [EMP_IVO.md](Employees/EMP_IVO.md) | Ivo Sá — platform administrator |
| [EMP_TIAGO.md](Employees/EMP_TIAGO.md) | Tiago Mendes — shelter and animal intake |
| [EMP_J_NAVARRO.md](Employees/EMP_J_NAVARRO.md) | João Navarro — commercial desk |
| [EMP_J_MARCELO.md](Employees/EMP_J_MARCELO.md) | João Marcelo — clinical lead |
| [EMP_CLI_ISABEL.md](Employees/EMP_CLI_ISABEL.md) | Isabel Carvalho — desk coordinator and client |
| [EMP_BERNARDO.md](Employees/EMP_BERNARDO.md) | Bernardo Silva — archived predecessor |

### Animals

| Story | Focus |
|-------|--------|
| [ANI_ROGERIM.md](Animals/ANI_ROGERIM.md) | Rogerim — shelter to Gonçalo |
| [ANI_JONAS.md](Animals/ANI_JONAS.md) | Jonas — Gonçalo’s cat, recurring care |
| [ANI_PIPOCA.md](Animals/ANI_PIPOCA.md) | Pipoca — Ana’s adopted cat |
| [ANI_BENTO.md](Animals/ANI_BENTO.md) | Bento — Ana’s senior cat, end of life |
| [ANI_FELIX.md](Animals/ANI_FELIX.md) | Felix — Marta’s dog, clinical arc |
| [ANI_QUICO.md](Animals/ANI_QUICO.md) | Quico — abandonment intake, awaiting home |
| [ANI_MAX.md](Animals/ANI_MAX.md) | Max — return to partner shelter |

### External partners

| Story | Focus |
|-------|--------|
| [EXT_PATINHAS_AVE.md](External_Entities/EXT_PATINHAS_AVE.md) | Associação Patinhas do Ave |
| [EXT_RESCATE_MINHO.md](External_Entities/EXT_RESCATE_MINHO.md) | Resgate Minhoto |
| [EXT_NORTEVET_SUPPLY.md](External_Entities/EXT_NORTEVET_SUPPLY.md) | NorteVet Supply Lda |

---

## How to use both layers

1. Read **00_ECOSYSTEM** and **TIMELINE** for the shared calendar.  
2. Use **Narrative Stories** for onboarding, demos, and domain context.  
3. Use **Operational Scenarios** when writing seed data, tests, or checking state transitions.

Nothing in this folder introduces new entities, workflows, or system capabilities beyond what the operational layer already defines.
