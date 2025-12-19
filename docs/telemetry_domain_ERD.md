```mermaid
erDiagram

  %% Core links (reference tables defined in other ERDs)
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_ANNOTATIONS : mrn_to_patient
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_COMPUTED_DATA : mrn_to_patient
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_LABS : mrn_to_patient
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_T3_DATA : mrn_to_patient
  CCUDM_DEMOGRAPHICS ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : mrn_to_patient

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : run_id_to_run
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ ETIOMETRY_ANNOTATIONS : run_id_to_run
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ ETIOMETRY_COMPUTED_DATA : run_id_to_run
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ ETIOMETRY_LABS : run_id_to_run
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ ETIOMETRY_T3_DATA : run_id_to_run

  %% Optional: computed data and labs can be treated as separate fact streams
  %% ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_COMPUTED_DATA : timestamp_alignment
  %% ETIOMETRY_T3_DATA ||--o{ ETIOMETRY_LABS : time_window_join

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk PK
    bigint mrn
    datetime time
    string run_id
    string source
    string feature
    string value
    string unit
    date dl_load_dt
    datetime dl_load_ts
  }

  ETIOMETRY_ANNOTATIONS {
    datetime event_at PK
    bigint mrn PK
    string run_id
    string event_type
    string initiative
    string description
    datetime created_at
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_COMPUTED_DATA {
    datetime timestamp PK
    bigint mrn PK
    string run_id
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_LABS {
    bigint mrn PK
    datetime performed PK
    string lab_name PK
    string run_id
    datetime charted
    double val
    string units
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  ETIOMETRY_T3_DATA {
    datetime timestamp PK
    bigint mrn PK
    string run_id
    date dl_load_dt
    datetime dl_load_ts
    string filename
  }

  %% Reference stubs (full definitions live in your other ERDs)
  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID PK
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG {
    string runid PK
    string pat_mrn_id
  }
