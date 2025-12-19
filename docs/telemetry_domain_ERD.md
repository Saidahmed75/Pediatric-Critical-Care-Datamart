```mermaid
erDiagram

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk
    int mrn
    string run_id
    string time
    string name
    string source
    string feature
    string value
    string unit
    string dl_load_dt
    string dl_load_ts
  }

  ETIOMETRY_ANNOTATIONS {
    int mrn
    string event_at
    string created_at
    string event_type
    string initiative
    string description
    string filename
    string dl_load_dt
    string dl_load_ts
  }

  ETIOMETRY_COMPUTED_DATA {
    int mrn
    string run_id
    string timestamp
    string dl_load_dt
    string dl_load_ts
    string filename
  }

  ETIOMETRY_LABS {
    int mrn
    string lab_name
    string performed
    string charted
    float val
    float ref_low
    string ref_high
    string units
    string admin_site
    string run_id
    string dl_load_dt
    string dl_load_ts
    string filename
  }

  ETIOMETRY_T3_DATA {
    int mrn
    string run_id
    string timestamp
    string dl_load_dt
    string dl_load_ts
    string filename
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER ||--o{ ETIOMETRY_T3_DATA : "mrn"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_COMPUTED_DATA : "mrn, run_id"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_LABS : "mrn, run_id"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_ANNOTATIONS : "mrn"
