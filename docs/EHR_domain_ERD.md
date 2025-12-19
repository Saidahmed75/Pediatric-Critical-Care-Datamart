```mermaid
erDiagram

  %% -----------------------------
  %% CCUDM core entities
  %% -----------------------------

  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID PK
    timestamp BIRTH_DATE
    string GENDER
    string RACE
    timestamp DEATH_DTTM
    string MORTALITY_STATUS
    decimal WEIGHT
    string HEIGHT
  }

  CCUDM_ENCOUNTERS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    string  INPATIENT_DATA_ID
    timestamp ADMIT_TIME
    timestamp DISCHARGE_TIME
    string DISCHARGE_DISPOSITION
    string VISIT_TYPE
    string LOCATION
  }

  CCUDM_ADT {
    string  PAT_MRN_ID PK
    decimal CSN PK
    timestamp EFFECTIVE_TIME PK
    string ADT_EVENT
    string PATIENT_CLASS
    string PATIENT_SERVICE
    string DEPARTMENT_NAME
    decimal EVENT_ID
  }

  CCUDM_INCLUSION_ENCOUNTER {
    string  PAT_MRN_ID PK
    decimal CSN PK
    timestamp EVENT_EFFECTIVE_TIME PK
    timestamp HOSPITAL_ADMIT_DTTM
    timestamp HOSPITAL_DISCHARGE_DTTM
    string EVENT_TYPE
    string DEPARTMENT
  }

  %% -----------------------------
  %% CCUDM modalities / domains
  %% -----------------------------

  CCUDM_FLOWSHEETS {
    string PAT_MRN_ID PK
    string INPATIENT_DATA_ID PK
    timestamp PERFORMED PK
    string FSD_ID PK
    int LINE PK
    string FLOWSHEET_NAME
    string MEASURE_NAME
    string VALUE
    string FLO_MEAS_ID
  }

  CCUDM_VENTILATION {
    string PAT_MRN_ID PK
    string INPATIENT_DATA_ID PK
    string VENT_START_FSD_ID PK
    int VENT_START_FSD_LINE PK
    timestamp VENT_START_DTTM
    timestamp VENT_END_DTTM
    string START_FLO_MEAS_ID
    string END_FLO_MEAS_ID
  }

  CCUDM_LAB_RESULTS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal LAB_ORDER_ID PK
    double  FIRST_LAB_LINE_NO PK
    int     SECOND_LAB_LINE_NO PK
    timestamp LAB_RSLT_COLLECTION_DTTM
    timestamp LAB_RSLT_DTTM
    string LAB_PROCEDURE
    string LAB_TEST
    string LAB_RSLT_VALUE
    string LAB_RSLT_UOM
  }

  CCUDM_LAB_RESULTS_SUSCEPTIBILITY {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal LAB_ORDER_ID PK
    double  FIRST_LAB_LINE_NO PK
    int     SECOND_LAB_LINE_NO PK
    int ANTIBIOTIC_LINE PK
    string ORGANISM_NAME
    string ANTIBIOTIC_NAME
    string SUSCEPTIBILITY
    string SENSITIVITY_VALUE
  }

  CCUDM_MEDICATION_ORDERS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal ORDER_ID PK
    decimal MEDICATION_ID PK
    timestamp MED_ORDER_DATE
    timestamp MED_START_DATE
    timestamp MED_END_DATE
    string MED_NAME
    string MED_ORDER_STATUS
  }

  CCUDM_MEDICATION_ADMINISTRATION {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal ORDER_ID PK
    decimal MEDICATION_ID PK
    int ORDER_LINE PK
    timestamp MED_ADMIN_DOSE_START_DATE
    timestamp MED_ADMIN_DOSE_STOP_DATE
    string MED_NAME
    string MED_ADMIN_STATUS_TEXT
    string MED_ADMIN_ROUTE
  }

  CCUDM_IMAGING {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal IMAGE_ORDER_ID PK
    timestamp IMAGE_TAKEN_DTTM
    timestamp RSLT_DTTM
    string LAB_PROCEDURE
    string ORDER_STATUS
  }

  CCUDM_IMAGING_IMPRESSIONS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal IMAGE_ORDER_ID PK
    timestamp IMAGE_TAKEN_DTTM PK
    int IMPRESSION_LINE PK
    string IMPRESSION_TEXT
  }

  CCUDM_ECG {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal ECG_ORDER_ID PK
    timestamp ECG_DTTM
    timestamp RSLT_DTTM
    string ORDER_STATUS
  }

  CCUDM_PFT {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal PFT_ORDER_ID PK
    double  FIRST_LAB_LINE_NO PK
    int     SECOND_LAB_LINE_NO PK
    timestamp LAB_RSLT_COLLECTION_DTTM
    timestamp LAB_RSLT_DTTM
    string LAB_PROCEDURE
    string LAB_TEST
    string LAB_RSLT_VALUE
  }

  CCUDM_PROCEDURE_ORDERS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal ORDER_ID PK
    timestamp PRIORITIZED_TIME
    string PROCEDURES
    string PRIORITIZED_TIME_TYPE
  }

  CCUDM_HOME_MEDICATIONS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal MEDICATION_ID PK
    int LINE PK
    string ADMISSION_MEDICATIONS
    string EVENT_ID
  }

  CCUDM_ISOLATION {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal ISO_ORDER_ID PK
    decimal LINE PK
    timestamp ISO_ADDED_TIME
    timestamp ISO_RMVD_TIME
    string ISOLATION_TYPE
    string ISO_CMNT
  }

  CCUDM_DIALYSIS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal DIAL_ORDER_ID PK
    int COMMENT_LINE PK
    string ORDER_STATUS
    string LAB_PROCEDURE
    string NARRATIVE
  }

  CCUDM_DIALYSIS_HISTORY {
    string PAT_MRN_ID PK
    decimal EPISODE_ID PK
    int HX_LINE PK
    timestamp DIALYSIS_START_DATE
    timestamp DIALYSIS_END_DATE
    string DIALYSIS_CENTER
    string DIALYSIS_DEPARTMENT
  }

  CCUDM_LDA {
    string  PAT_MRN_ID PK
    decimal CSN PK
    string  IP_LDA_ID PK
    timestamp PLACEMENT_INSTANT
    timestamp REMOVAL_INSTANT
    string LDA_DESCRIPTION
    string LDA_SITE
  }

  CCUDM_COMORBIDITIES {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal DX_ID PK
    int LINE PK
    timestamp RECORDED_DATE
    string ICD_CODES
    string DIAGNOSIS
    string DIAGNOSIS_SOURCE
  }

  CCUDM_VACCINATIONS {
    string  PAT_MRN_ID PK
    decimal CSN PK
    decimal IMMUNE_ID PK
    timestamp IMMUNE_DATE
    string VACCINE
    string STATUS
  }

  CCUDM_VAPING {
    string PAT_MRN_ID PK
    decimal HLV_ID PK
    int LINE PK
    timestamp VAPE_START_DATE
    timestamp VAPE_QUIT_DATE
    string CONCEPT_NAME
    string SMRTDTA_ELEM_VALUE
  }

  CCUDM_MRN_MERGE_HISTORY {
    string PAT_MRN_ID PK
    string MERGED_PAT_MRN PK
  }

  CCUDM_PATIENT_INCLUSION_REASON {
    string PAT_MRN_ID PK
    string STATIC_COHORT_CRITERIA_MET
    string AUTOMATED_COHORT_CRITERIA_MET
    date   AUTOMATED_COHORT_CRITERIA_MET_DATE
    string ECMO_COHORT_CRITERIA_MET
    string REGISTRY_COHORT_CRITERIA_MET
  }

  CCUDM_ECMO_COHORT_REPORT {
    string runid PK
    string pat_mrn_id
    timestamp date_on_ecmo
    string mode
    string unit
  }

  CCUDM_REGISTRY_COHORT_REPORT {
    string id PK
    bigint pat_mrn_id
    timestamp adm_date
    string discharge_date
    string registry
  }

  %% -----------------------------
  %% Optional bridge to ECMO_LOG (from your ECMO schema)
  %% -----------------------------
  ECMO_LOG {
    string runid PK
    int    pat_mrn_id
    timestamp date_on_ecmo
    string mode
    string unit
  }

  %% -----------------------------
  %% Relationships (Crow's foot)
  %% -----------------------------

  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_ENCOUNTERS : "PAT_MRN_ID"
  CCUDM_ENCOUNTERS  ||--o{ CCUDM_ADT       : "CSN"
  CCUDM_ENCOUNTERS  ||--o{ CCUDM_INCLUSION_ENCOUNTER : "CSN"

  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_COMORBIDITIES : "PAT_MRN_ID"
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VAPING        : "PAT_MRN_ID"
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_PATIENT_INCLUSION_REASON : "PAT_MRN_ID"
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_MRN_MERGE_HISTORY : "PAT_MRN_ID"

  CCUDM_ENCOUNTERS ||--o{ CCUDM_LAB_RESULTS : "CSN"
  CCUDM_LAB_RESULTS ||--o{ CCUDM_LAB_RESULTS_SUSCEPTIBILITY : "LAB_ORDER_ID"

  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ORDERS : "CSN"
  CCUDM_MEDICATION_ORDERS ||--o{ CCUDM_MEDICATION_ADMINISTRATION : "ORDER_ID"

  CCUDM_ENCOUNTERS ||--o{ CCUDM_IMAGING : "CSN"
  CCUDM_IMAGING ||--o{ CCUDM_IMAGING_IMPRESSIONS : "IMAGE_ORDER_ID"

  CCUDM_ENCOUNTERS ||--o{ CCUDM_ECG : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_PFT : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_PROCEDURE_ORDERS : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_HOME_MEDICATIONS : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ISOLATION : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_DIALYSIS : "CSN"
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_DIALYSIS_HISTORY : "PAT_MRN_ID"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LDA : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_VACCINATIONS : "CSN"

  %% Encounter/stay-linked modalities
  CCUDM_ENCOUNTERS ||--o{ CCUDM_FLOWSHEETS : "PAT_MRN_ID"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_VENTILATION : "INPATIENT_DATA_ID"

  %% Reports
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_ECMO_COHORT_REPORT : "PAT_MRN_ID"
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_REGISTRY_COHORT_REPORT : "PAT_MRN_ID"

  %% Bridge to ECMO_LOG (combined ERD anchor)
  ECMO_LOG ||--o{ CCUDM_ENCOUNTERS : "PAT_MRN_ID"
  ECMO_LOG ||--o{ CCUDM_ECMO_COHORT_REPORT : "runid"
