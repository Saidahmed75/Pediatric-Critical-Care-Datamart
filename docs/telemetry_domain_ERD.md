```mermaid
erDiagram
  PATIENT {
    string pat_mrn_id PK
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk PK
    string mrn FK
    string run_id
    timestamp time
    string name
    string source
    string feature
    string value
    string unit
    date dl_load_dt
    timestamp dl_load_ts
  }

  ETIOMETRY_ANNOTATIONS {
    string mrn FK
    timestamp event_at
    timestamp created_at
    string event_type
    string initiative
    string description
    string filename
    date dl_load_dt
    timestamp dl_load_ts
  }

  ETIOMETRY_COMPUTED_DATA {
    string mrn FK
    string run_id
    timestamp timestamp
    date dl_load_dt
    timestamp dl_load_ts
    string filename
  }

  ETIOMETRY_LABS {
    string mrn FK
    string run_id
    string lab_name
    timestamp performed
    timestamp charted
    double val
    double ref_low
    string ref_high
    string units
    string admin_site
    date dl_load_dt
    timestamp dl_load_ts
    string filename
  }

  ETIOMETRY_T3_DATA {
    string mrn FK
    string run_id
    timestamp timestamp
    date dl_load_dt
    timestamp dl_load_ts
    string filename
  }

  PATIENT ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : has
  PATIENT ||--o{ ETIOMETRY_ANNOTATIONS : has
  PATIENT ||--o{ ETIOMETRY_COMPUTED_DATA : has
  PATIENT ||--o{ ETIOMETRY_LABS : has
  PATIENT ||--o{ ETIOMETRY_T3_DATA : has
