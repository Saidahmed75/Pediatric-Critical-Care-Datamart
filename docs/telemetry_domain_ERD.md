```mermaid
erDiagram

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    PK pk string
    mrn int
    run_id string
    time datetime
    name string
    source string
    feature string
    value string
    unit string
    dl_load_dt date
    dl_load_ts datetime
  }

  ETIOMETRY_ANNOTATIONS {
    mrn string
    event_at datetime
    created_at datetime
    event_type string
    initiative string
    description string
    filename string
    dl_load_dt date
    dl_load_ts datetime
  }

  ETIOMETRY_COMPUTED_DATA {
    mrn int
    run_id string
    timestamp datetime
    dl_load_dt date
    dl_load_ts datetime
    filename string
  }

  ETIOMETRY_LABS {
    mrn int
    run_id string
    performed datetime
    charted datetime
    lab_name string
    val float
    units string
    admin_site string
    dl_load_dt date
    dl_load_ts datetime
    filename string
  }

  ETIOMETRY_T3_DATA {
    mrn int
    run_id string
    timestamp datetime
    dl_load_dt date
    dl_load_ts datetime
    filename string
  }

  %% Conceptual links (MRN and time alignment)
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_COMPUTED_DATA : "mrn,timestamp"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_LABS : "mrn,performed"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_ANNOTATIONS : "mrn,event_at"
  ETIOMETRY_T3_DATA ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : "mrn,time"
