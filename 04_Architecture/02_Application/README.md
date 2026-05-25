# Application architecture

<div style="display:flex; gap:8px; flex-wrap:wrap; margin-bottom:1rem;">
  <span style="background:#64748b;color:#fff;padding:4px 10px;border-radius:6px;font-size:0.85rem;">In development</span>
</div>

The MiaCaoMigo **application layer** is implemented in the sibling repository **`02_MiaCaoMigo_Application`** (when available). This folder is reserved for application-facing architecture documentation in the Engineering portal.

---

## Scope (planned)

| Topic | Note |
|-------|------|
| Layering | UI, API orchestration, consumption of DataLayer `svc_*` / services |
| Integration | Authentication, appointments, commercial flows aligned with M1–M4 |
| Diagrams | UML and application views — see [03_Diagrams](../../03_Diagrams/) when published |

---

## Sprint 2 RF delegated to API (not DataLayer)

From [RF traceability matrix](../../02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) — implement or specify here before claiming acceptance:

| Area | RF / topic |
|------|------------|
| **Authentication** | RF_12 change password; RF_13 hash algorithm; RF_14 password history (schema **INC**) |
| **GDPR** | RF_42 erasure/anonymization; RF_43 legal retention workflow |
| **Profile** | RF_09 personal data updates (no `svc_*` today) |
| **Absence** | RF_31 cancel within 72h; RF_38 permission exceptions |
| **M2** | RF_05 auto-create client on delivery |
| **M3** | RF_01 product admin UI; RF_28 history filters; RF_29–30 reports |
| **M4** | All appointment **writes** (no `svc_*` — call `sp_*` or add API wrappers); RF_07 mandatory diagnosis; RF_17 auto-invoice on complete |
| **Infrastructure** | PDF NFR: HTTPS, uptime, latency |

---

## Where to read today

| Need | Document |
|------|----------|
| System context | [00_System_Architecture.md](../00_System_Architecture.md) |
| Persistence & services | [01_Database/README.md](../01_Database/README.md) |
| RF implementation grid | [02_Requirements/Sprint2/01_RF_Traceability_Matrix.md](../../02_Requirements/Sprint2/01_RF_Traceability_Matrix.md) |
| Ecosystem / demo behaviour | [Ecosystem](../../01_Planning/01_UserStories/02_Operational_Scenarios/00_ECOSYSTEM.md) |

Do not document API endpoints or UI modules here until they exist in the Application repository.

---

[← Architecture hub](../README.md)
