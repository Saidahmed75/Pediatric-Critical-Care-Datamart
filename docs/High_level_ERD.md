```mermaid
erDiagram
  PATIENT {
    string PAT_MRN_ID
    string pat_id
  }

  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID
  }

  CCUDM_ENCOUNTERS {
    string PAT_MRN_ID
    string CSN
    string INPATIENT_DATA_ID
  }

  CCUDM_FLOWSHEETS {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  CCUDM_LABS {
    string PAT_MRN_ID
    string CSN
  }

  CCUDM_MED_ORDERS {
    string PAT_MRN_ID
    string CSN
    string ORDER_ID
  }

  CCUDM_MED_ADMIN {
    string PAT_MRN_ID
    string CSN
    string ORDER_ID
  }

  ECMO_LOG {
    string runid
    string pat_mrn_id
    string inpatient_data_id
    string pat_enc_csn_id
  }

  ELSO_PATIENT_RUN {
    string patientid
    string runid
    int runno
  }

  TELE_BEDMASTER {
    string mrn
    string run_id
  }

  TELE_ETIOMETRY_COMPUTED {
    string mrn
    string run_id
  }

  NEURO_OUTCOMES {
    string epicmrn
    string pat_id
  }

  PATIENT ||--o{ CCUDM_DEMOGRAPHICS : "by PAT_MRN_ID"
  PATIENT ||--o{ CCUDM_ENCOUNTERS   : "by PAT_MRN_ID"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_FLOWSHEETS : "by INPATIENT_DATA_ID"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LABS       : "by PAT_MRN_ID, CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MED_ORDERS : "by PAT_MRN_ID, CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MED_ADMIN  : "by PAT_MRN_ID, CSN"

  ELSO_PATIENT_RUN ||--|| ECMO_LOG : "by runid"
  ECMO_LOG ||--|| PATIENT          : "pat_mrn_id = PAT_MRN_ID"
  ECMO_LOG ||--o{ CCUDM_ENCOUNTERS : "pat_enc_csn_id = CSN"
  ECMO_LOG ||--o{ CCUDM_FLOWSHEETS : "inpatient_data_id"

  PATIENT ||--o{ TELE_BEDMASTER          : "mrn = PAT_MRN_ID"
  PATIENT ||--o{ TELE_ETIOMETRY_COMPUTED : "mrn = PAT_MRN_ID"

  NEURO_OUTCOMES }o--|| PATIENT     : "epicmrn = PAT_MRN_ID"
  NEURO_OUTCOMES }o--|| ELSO_PATIENT_RUN : "via pat_id/runid"
