```mermaid
erDiagram

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    pk string
    mrn int
    run_id string
    time string
    name string
    source string
    feature string
    value string
    unit string
    dl_load_dt string
    dl_load_ts string
  }

  ETIOMETRY_ANNOTATIONS {
    mrn int
    event_at string
    created_at string
    event_type string
    initiative string
    description string
    filename string
    dl_load_dt string
    dl_load_ts string
  }

  ETIOMETRY_COMPUTED_DATA {
    mrn int
    run_id string
    timestamp string
    dl_load_dt string
    dl_load_ts string
    filename string
  }

  ETIOMETRY_LABS {
    mrn int
    lab_name string
    performed string
    charted string
    val float
    ref_low float
    ref_high string
    units string
    admin_site string
    run_id string
    dl_load_dt string
    dl_load_ts string
    filename string
  }

  ETIOMETRY_T3_DATA {
    mrn int
    run_id string
    timestamp string
    dl_load_dt string
    dl_load_ts string
    filename string
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER ||--o{ ETIOMETRY_T3_DATA : "mrn"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_COMPUTED_DATA : "mrn, run_id"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_LABS : "mrn, run_id"
  ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_ANNOTATIONS : "mrn"
