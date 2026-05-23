# External Entity — Associação Patinhas do Ave

> Type: **Shelter** · Table: `external_entity`

| Field | Value |
|---|---|
| Location | Avenida Marechal Gomes da Costa, Vila Nova de Famalicão |
| Phone | +351252401880 |
| Email | contacto@patinhasave.pt |

## Role in ecosystem

Primary **partner shelter** for Braga clinic.

| Animal | Interaction |
|---|---|
| [Rogerim](../03_Animals/ANI_ROGERIM.md) | Delivery 4 May → adopted by Gonçalo |
| [Pipoca](../03_Animals/ANI_PIPOCA.md) | Transfer 5 May → adopted by Ana |
| [Max](../03_Animals/ANI_MAX.md) | Concession return 20 May (`Transferido`) |

## Operations

- `sp_record_delivery` with `id_ext_ent` → sets animal **Interno**
- `sp_process_concession` when placement fails at clinic

## Staff contact

Tiago coordinates transport slots; Isabel phones foster updates to adopters.

## Validates

Shelter-type `typ_ext_ent`; bidirectional animal movement (in and out).
