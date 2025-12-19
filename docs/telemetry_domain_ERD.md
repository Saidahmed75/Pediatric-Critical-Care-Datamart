```mermaid
```mermaid
erDiagram

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk PK
    int mrn
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
    int mrn
    string run_id
    datetime timestamp
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_LABS {
    int mrn
    string lab_name
    datetime performed
    datetime charted
    float val
    float ref_low
    string ref_high
    string units
    string admin_site
    string run_id
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_T3_DATA {
    datetime timestamp
    int mrn
    string run_id
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER }o--|| ETIOMETRY_T3_DATA
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_COMPUTED_DATA
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_LABS
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_ANNOTATIONS
```
