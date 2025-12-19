```mermaid
erDiagram

  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID PK
  }

  ECMO_LOG {
    string runid PK
    string pat_mrn_id
  }

  NEURO_OUTCOMES {
    string unique_id PK
    bigint epicmrn FK
    string eventname
    string repeatinstrument
    bigint repeatinstance
    string pat_id
    string dateoficuadmission
    string dateoficudischarge
    string death
  }

  CCUDM_DEMOGRAPHICS ||--o{ NEURO_OUTCOMES : MRN_link
  ECMO_LOG          ||--o{ NEURO_OUTCOMES : MRN_link
