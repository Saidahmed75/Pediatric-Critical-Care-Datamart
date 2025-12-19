```mermaid
erDiagram
  PATIENT {
    string pat_mrn_id_pk
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk_pk
    string mrn
    string run_id
    datetime time
    string name
    string source
    string feature
    string value
    string unit
    date dl_load_dt
    datetime dl_load_ts
  }

  ETIOMETRY_ANNOTATIONS {
    string mrn
    datetime event_at
    datetime created_at
    string event_type
    string initiative
    string description
    string filename
    date dl_load_dt
    datetime dl_load_ts
  }

  ETIOMETRY_COMPUTED_DATA {
    string mrn
    string run_id
    datetime ts
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_LABS {
    string mrn
    string run_id
    string lab_name
    datetime performed
    datetime charted
    float val
    float ref_low
    string ref_high
    string units
    string admin_site
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_T3_DATA {
    string mrn
    string run_id
    datetime ts
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  PATIENT ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : has_mrn
  PATIENT ||--o{ ETIOMETRY_ANNOTATIONS : has_mrn
  PATIENT ||--o{ ETIOMETRY_COMPUTED_DATA : has_mrn
  PATIENT ||--o{ ETIOMETRY_LABS : has_mrn
  PATIENT ||--o{ ETIOMETRY_T3_DATA : has_mrn
