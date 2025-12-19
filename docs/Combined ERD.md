```mermaid
erDiagram

  %% =========================
  %% ECMO core
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG {
    string runid PK
    string pat_mrn_id FK
    string pat_enc_csn_id
    string inpatient_data_id
    timestamp date_on_ecmo
    string date_off_ecmo
    string mode
    string unit
  }

  %% =========================
  %% ECMO-ELSO tables (keyed to ECMO_LOG via runid)
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PATIENT_RUN {
    string runid FK
    int runno
    string patientid
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANnULA {
    string cannulapk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANNULA_PURPOSE {
    string canpurid PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CARDDX {
    string carddxpk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_COMPLICATIONS {
    string complicpk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_DIAGNOSES {
    string diagnosespk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_EQUIPMENT {
    string equippk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_MEMBLUNG {
    string membpk PK
    string runid FK
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_ORGANISMS {
    string orgpk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PRE_SUPPORT {
    string prsupppk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PROCEDURES {
    string procedurepk PK
    string runid FK
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PUMP {
    string pumppk PK
    string runid FK
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_RUNDETAIL {
    string rundetailid PK
    string runid FK
    int runno
  }

  %% =========================
  %% EHR CCUDM (linked to ECMO_LOG by pat_mrn_id)
  %% Note: composite PKs implied; using key columns only
  %% =========================
  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID PK
  }

  CCUDM_ENCOUNTERS {
    string PAT_MRN_ID FK
    decimal CSN
    string INPATIENT_DATA_ID
  }

  CCUDM_ADT {
    string PAT_MRN_ID FK
    decimal CSN
    timestamp EFFECTIVE_TIME
  }

  CCUDM_COMORBIDITIES {
    string PAT_MRN_ID FK
    decimal CSN
    decimal dx_id
    int LINE
  }

  CCUDM_DIALYSIS {
    string PAT_MRN_ID FK
    decimal CSN
    decimal DIAL_ORDER_ID
    int COMMENT_LINE
  }

  CCUDM_DIALYSIS_HISTORY {
    string PAT_MRN_ID FK
    decimal EPISODE_ID
    decimal HX_CSN_ID
    int HX_LINE
  }

  CCUDM_ECG {
    string PAT_MRN_ID FK
    decimal CSN
    decimal ECG_ORDER_ID
    timestamp ECG_DTTM
  }

  CCUDM_ECMO_COHORT_REPORT {
    string runid FK
    string pat_mrn_id FK
  }

  CCUDM_FLOWSHEETS {
    string PAT_MRN_ID FK
    string INPATIENT_DATA_ID FK
    timestamp PERFORMED
    int LINE
    string FSD_ID
  }

  CCUDM_HOME_MEDICATIONS {
    string PAT_MRN_ID FK
    decimal CSN
    decimal MEDICATION_ID
    int LINE
  }

  CCUDM_IMAGING {
    string PAT_MRN_ID FK
    decimal CSN
    decimal IMAGE_ORDER_ID
    timestamp IMAGE_TAKEN_DTTM
  }

  CCUDM_IMAGING_IMPRESSIONS {
    string PAT_MRN_ID FK
    decimal CSN
    decimal IMAGE_ORDER_ID
    int IMPRESSION_LINE
  }

  CCUDM_INCLUSION_ENCOUNTER {
    string PAT_MRN_ID FK
    decimal CSN
    timestamp HOSPITAL_ADMIT_DTTM
  }

  CCUDM_ISOLATION {
    string PAT_MRN_ID FK
    decimal CSN
    decimal ISO_ORDER_ID
    decimal LINE
  }

  CCUDM_LAB_RESULTS {
    string PAT_MRN_ID FK
    decimal CSN
    decimal LAB_ORDER_ID
    double FIRST_LAB_LINE_NO
    int SECOND_LAB_LINE_NO
    timestamp LAB_RSLT_COLLECTION_DTTM
  }

  CCUDM_LAB_RESULTS_SUSCEPTIBILITY {
    string PAT_MRN_ID FK
    decimal CSN
    decimal LAB_ORDER_ID
    double FIRST_LAB_LINE_NO
    int SECOND_LAB_LINE_NO
    int ANTIBIOTIC_LINE
  }

  CCUDM_LDA {
    string PAT_MRN_ID FK
    decimal CSN
    string IP_LDA_ID
    timestamp PLACEMENT_INSTANT
  }

  CCUDM_MEDICATION_ADMINISTRATION {
    string PAT_MRN_ID FK
    decimal CSN
    decimal ORDER_ID
    int ORDER_LINE
    timestamp MED_ADMIN_DOSE_START_DATE
  }

  CCUDM_MEDICATION_ORDERS {
    string PAT_MRN_ID FK
    decimal CSN
    decimal ORDER_ID
    timestamp MED_ORDER_DATE
  }

  CCUDM_MRN_MERGE_HISTORY {
    string PAT_MRN_ID FK
    string MERGED_PAT_MRN
  }

  CCUDM_PATIENT_INCLUSION_REASON {
    string PAT_MRN_ID FK
  }

  CCUDM_PFT {
    string PAT_MRN_ID FK
    decimal CSN
    decimal PFT_ORDER_ID
    timestamp LAB_RSLT_COLLECTION_DTTM
  }

  CCUDM_PROCEDURE_ORDERS {
    string PAT_MRN_ID FK
    decimal CSN
    decimal ORDER_ID
    timestamp PRIORITIZED_TIME
  }

  CCUDM_REGISTRY_COHORT_REPORT {
    bigint pat_mrn_id FK
    timestamp adm_date
  }

  CCUDM_VACCINATIONS {
    decimal IMMUNE_ID
    string PAT_MRN_ID FK
    timestamp IMMUNE_DATE
    decimal CSN
  }

  CCUDM_VAPING {
    string PAT_MRN_ID FK
    decimal HLV_ID
    int LINE
  }

  CCUDM_VENTILATION {
    string PAT_MRN_ID FK
    string INPATIENT_DATA_ID FK
    timestamp VENT_START_DTTM
  }

  %% =========================
  %% Neuro outcomes (linked by MRN)
  %% =========================
  NEURO_OUTCOMES {
    string unique_id PK
    bigint epicmrn FK
  }

  %% =========================
  %% Etiometry and BedMaster telemetry (linked by MRN; optional run_id)
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk PK
    string mrn FK
    string run_id
    timestamp time
  }

  ETIOMETRY_ANNOTATIONS {
    string mrn FK
    timestamp event_at
  }

  ETIOMETRY_COMPUTED_DATA {
    string mrn FK
    string run_id
    timestamp timestamp
  }

  ETIOMETRY_LABS {
    string mrn FK
    string run_id
    timestamp performed
  }

  ETIOMETRY_T3_DATA {
    string mrn FK
    string run_id
    timestamp timestamp
  }

  %% =========================
  %% Relationships
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PATIENT_RUN : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANnULA : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANNULA_PURPOSE : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CARDDX : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_COMPLICATIONS : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_DIAGNOSES : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_EQUIPMENT : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_MEMBLUNG : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_ORGANISMS : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PRE_SUPPORT : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PROCEDURES : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PUMP : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_RUNDETAIL : runid

  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_ENCOUNTERS : PAT_MRN_ID
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ADT : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_COMORBIDITIES : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_DIALYSIS : CSN
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_DIALYSIS_HISTORY : PAT_MRN_ID
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ECG : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_HOME_MEDICATIONS : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_IMAGING : CSN
  CCUDM_IMAGING ||--o{ CCUDM_IMAGING_IMPRESSIONS : IMAGE_ORDER_ID
  CCUDM_ENCOUNTERS ||--o{ CCUDM_INCLUSION_ENCOUNTER : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ISOLATION : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LAB_RESULTS : CSN
  CCUDM_LAB_RESULTS ||--o{ CCUDM_LAB_RESULTS_SUSCEPTIBILITY : LAB_ORDER_ID
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LDA : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ADMINISTRATION : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ORDERS : CSN
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_MRN_MERGE_HISTORY : PAT_MRN_ID
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_PATIENT_INCLUSION_REASON : PAT_MRN_ID
  CCUDM_ENCOUNTERS ||--o{ CCUDM_PFT : CSN
  CCUDM_ENCOUNTERS ||--o{ CCUDM_PROCEDURE_ORDERS : CSN
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VACCINATIONS : PAT_MRN_ID
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VAPING : PAT_MRN_ID
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VENTILATION : PAT_MRN_ID

  %% Linkage across domains by MRN
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG }o--|| CCUDM_DEMOGRAPHICS : pat_mrn_id
  CCUDM_DEMOGRAPHICS ||--o{ NEURO_OUTCOMES : PAT_MRN_ID_to_epicmrn

  CCUDM_DEMOGRAPHICS ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : PAT_MRN_ID_to_mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_ANNOTATIONS : PAT_MRN_ID_to_mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_COMPUTED_DATA : PAT_MRN_ID_to_mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_LABS : PAT_MRN_ID_to_mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_T3_DATA : PAT_MRN_ID_to_mrn
