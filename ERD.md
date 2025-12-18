```mermaid
erDiagram

  %% -------------------------
  %% Core cohort / encounter
  %% -------------------------
  CCUDM_PATIENT_INCLUSION_REASON {
    string PAT_MRN_ID PK
    string ECMO_COHORT_CRITERIA_MET
  }

  CCUDM_ENCOUNTERS {
    string PAT_MRN_ID FK
    string CSN
    string INPATIENT_DATA_ID
  }

  %% -------------------------
  %% CCUDM modality tables
  %% -------------------------
  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID FK
  }

  CCUDM_ADT {
    string PAT_MRN_ID FK
    string CSN FK
  }

  CCUDM_FLOWSHEETS {
    string PAT_MRN_ID FK
    string FLOWSHEET_NAME
  }

  CCUDM_LAB_RESULTS {
    string PAT_MRN_ID FK
    string LAB_RSLT_VALUE
  }

  CCUDM_IMAGING {
    string PAT_MRN_ID FK
    string IMAGE_ORDER_ID
  }

  CCUDM_COMORBIDITIES {
    string PAT_MRN_ID FK
    string ICD_CODES
  }

  CCUDM_MEDICATION_ORDERS {
    string PAT_MRN_ID FK
    string CSN FK
    string ORDER_ID PK
  }

  CCUDM_MEDICATION_ADMINISTRATION {
    string PAT_MRN_ID FK
    string ORDER_ID FK
    string MED_ADMIN_DOSE_START_DATE
  }

  CCUDM_VENTILATION {
    string PAT_MRN_ID FK
    string VENT_START_DTTM
  }

  CCUDM_DIALYSIS {
    string PAT_MRN_ID FK
    string DIAL_ORDER_ID
  }

  CCUDM_VACCINATIONS {
    string PAT_MRN_ID FK
    string IMMUNE_DATE
  }

  %% -------------------------
  %% Telemetry + neuro
  %% -------------------------
  BEDMASTER {
    string MRN FK
    string FEATURE
    string TIMESTAMP
  }

  ETIOMETRY_DATA {
    string MRN FK
    string FEATURE
    string TIMESTAMP
  }

  NEURO_OUTCOMES {
    string EPICMRN FK
    string PAT_ID
    string EEG_START_DATE_TIME
  }

  %% -------------------------
  %% ECMO domain + ELSO
  %% -------------------------
  ECMO_LOG {
    string RUNID PK
    string PAT_MRN_ID FK
    string DATE_ON_ECMO
    string DATE_OFF_ECMO
  }

  ELSO_RUNDETAIL {
    string PATIENTID
    string RUNID FK
    int RUNNO
  }

  ELSO_COMPLICATIONS {
    string PATIENTID
    string RUNID FK
    int RUNNO
  }

  ELSO_CANNULA {
    string PATIENTID
    string RUNID FK
    int RUNNO
  }

  ELSO_MEMBLUNG {
    string PATIENTID
    string RUNID FK
  }

  ELSO_ORGANISMS {
    string PATIENTID
    string RUNID FK
    int RUNNO
  }

  ELSO_PROCEDURES {
    string PATIENTID
    string RUNID FK
    int RUNNO
  }

  %% -------------------------
  %% Relationships
  %% -------------------------

  %% Patient-level hub
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_ENCOUNTERS : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_DEMOGRAPHICS : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_FLOWSHEETS : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_LAB_RESULTS : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_IMAGING : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_COMORBIDITIES : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_VENTILATION : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_DIALYSIS : "PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ CCUDM_VACCINATIONS : "PAT_MRN_ID"

  %% Encounter joins (CSN)
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ADT : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ORDERS : "CSN"

  %% Orders -> administrations (ORDER_ID)
  CCUDM_MEDICATION_ORDERS ||--o{ CCUDM_MEDICATION_ADMINISTRATION : "ORDER_ID"

  %% Telemetry / neuro joins (MRN = PAT_MRN_ID)
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ BEDMASTER : "MRN = PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ ETIOMETRY_DATA : "MRN = PAT_MRN_ID"
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ NEURO_OUTCOMES : "EPICMRN = PAT_MRN_ID"

  %% ECMO log joins
  CCUDM_PATIENT_INCLUSION_REASON ||--o{ ECMO_LOG : "PAT_MRN_ID"

  %% ELSO joins (RUNID)
  ECMO_LOG ||--o{ ELSO_RUNDETAIL : "RUNID"
  ECMO_LOG ||--o{ ELSO_COMPLICATIONS : "RUNID"
  ECMO_LOG ||--o{ ELSO_CANNULA : "RUNID"
  ECMO_LOG ||--o{ ELSO_MEMBLUNG : "RUNID"
  ECMO_LOG ||--o{ ELSO_ORGANISMS : "RUNID"
  ECMO_LOG ||--o{ ELSO_PROCEDURES : "RUNID"
