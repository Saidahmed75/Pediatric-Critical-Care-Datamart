```mermaid
erDiagram

  ccudm_demographics {
    string PAT_MRN_ID
  }

  ccudm_encounters {
    string PAT_MRN_ID
    string CSN
    string INPATIENT_DATA_ID
  }

  ccudm_adt {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_comorbidities {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_inclusion_encounter {
    string PAT_MRN_ID
  }

  ccudm_registry_cohort_report {
    string pat_mrn_id
  }

  ccudm_patient_inclusion_reason {
    string PAT_MRN_ID
  }

  ccudm_flowsheets {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  ccudm_lda {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  ccudm_ventilation {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  ccudm_lab_results {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_lab_results_susceptibility {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_imaging {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_imaging_impressions {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_medication_orders {
    string PAT_MRN_ID
    string CSN
    string ORDER_ID
  }

  ccudm_medication_administration {
    string PAT_MRN_ID
    string CSN
    string ORDER_ID
  }

  ccudm_home_medications {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_dialysis {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_dialysis_history {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_ecg {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_isolation {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_mrn_merge_history {
    string PAT_MRN_ID
  }

  ccudm_pft {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_procedure_orders {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_vaccinations {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_vaping {
    string PAT_MRN_ID
  }

  %% Relationships
  ccudm_demographics ||--o{ ccudm_encounters : "PAT_MRN_ID"
  ccudm_encounters ||--o{ ccudm_adt : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_comorbidities : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_lab_results : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_medication_orders : "PAT_MRN_ID, CSN"
  ccudm_medication_orders ||--o{ ccudm_medication_administration : "ORDER_ID"
  ccudm_encounters ||--o{ ccudm_imaging : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_imaging_impressions : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_pft : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_procedure_orders : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_ecg : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_isolation : "PAT_MRN_ID, CSN"

  ccudm_encounters ||--o{ ccudm_flowsheets : "INPATIENT_DATA_ID"
  ccudm_encounters ||--o{ ccudm_ventilation : "INPATIENT_DATA_ID"
  ccudm_encounters ||--o{ ccudm_lda : "INPATIENT_DATA_ID"

  ccudm_demographics ||--o{ ccudm_mrn_merge_history : "PAT_MRN_ID"
  ccudm_demographics ||--o{ ccudm_patient_inclusion_reason : "PAT_MRN_ID"
  ccudm_demographics ||--o{ ccudm_registry_cohort_report : "PAT_MRN_ID"
