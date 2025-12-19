```mermaid
erDiagram

  %% =========================
  %% ECMO core
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG {
    string runid_pk
    string pat_mrn_id
    string pat_enc_csn_id
    string inpatient_data_id
    datetime date_on_ecmo
    string date_off_ecmo
    string mode
    string unit
  }

  %% =========================
  %% ECMO-ELSO tables (linked to ECMO_LOG by runid)
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PATIENT_RUN {
    string runid
    int runno
    string patientid
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANNULA {
    string cannulapk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANNULA_PURPOSE {
    string canpurid_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CARDDX {
    string carddxpk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_COMPLICATIONS {
    string complicpk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_DIAGNOSES {
    string diagnosespk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_EQUIPMENT {
    string equippk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_MEMBLUNG {
    string membpk_pk
    string runid
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_ORGANISMS {
    string orgpk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PRE_SUPPORT {
    string prsupppk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PROCEDURES {
    string procedurepk_pk
    string runid
    int runno
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PUMP {
    string pumppk_pk
    string runid
  }

  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_RUNDETAIL {
    string rundetailid_pk
    string runid
    int runno
    datetime starttime
    datetime endtime
  }

  %% =========================
  %% EHR CCUDM (linked by PAT_MRN_ID)
  %% =========================
  CCUDM_DEMOGRAPHICS {
    string pat_mrn_id_pk
  }

  CCUDM_ENCOUNTERS {
    string pat_mrn_id
    decimal csn
    string inpatient_data_id
    datetime admit_time
    datetime discharge_time
  }

  CCUDM_ADT {
    string pat_mrn_id
    decimal csn
    datetime effective_time
  }

  CCUDM_COMORBIDITIES {
    string pat_mrn_id
    decimal csn
    decimal dx_id
    int line
  }

  CCUDM_DIALYSIS {
    string pat_mrn_id
    decimal csn
    decimal dial_order_id
    int comment_line
  }

  CCUDM_DIALYSIS_HISTORY {
    string pat_mrn_id
    decimal episode_id
    decimal hx_csn_id
    int hx_line
  }

  CCUDM_ECG {
    string pat_mrn_id
    decimal csn
    decimal ecg_order_id
    datetime ecg_dttm
  }

  CCUDM_ECMO_COHORT_REPORT {
    string runid
    string pat_mrn_id
  }

  CCUDM_FLOWSHEETS {
    string pat_mrn_id
    string inpatient_data_id
    datetime performed
    int line
    string fsd_id
  }

  CCUDM_HOME_MEDICATIONS {
    string pat_mrn_id
    decimal csn
    decimal medication_id
    int line
  }

  CCUDM_IMAGING {
    string pat_mrn_id
    decimal csn
    decimal image_order_id
    datetime image_taken_dttm
  }

  CCUDM_IMAGING_IMPRESSIONS {
    string pat_mrn_id
    decimal csn
    decimal image_order_id
    int impression_line
  }

  CCUDM_INCLUSION_ENCOUNTER {
    string pat_mrn_id
    decimal csn
    datetime hospital_admit_dttm
    datetime hospital_discharge_dttm
  }

  CCUDM_ISOLATION {
    string pat_mrn_id
    decimal csn
    decimal iso_order_id
    decimal line
  }

  CCUDM_LAB_RESULTS {
    string pat_mrn_id
    decimal csn
    decimal lab_order_id
    double first_lab_line_no
    int second_lab_line_no
    datetime lab_rslt_collection_dttm
  }

  CCUDM_LAB_RESULTS_SUSCEPTIBILITY {
    string pat_mrn_id
    decimal csn
    decimal lab_order_id
    double first_lab_line_no
    int second_lab_line_no
    int antibiotic_line
  }

  CCUDM_LDA {
    string pat_mrn_id
    decimal csn
    string ip_lda_id
    datetime placement_instant
    datetime removal_instant
  }

  CCUDM_MEDICATION_ADMINISTRATION {
    string pat_mrn_id
    decimal csn
    decimal order_id
    int order_line
    datetime med_admin_dose_start_date
  }

  CCUDM_MEDICATION_ORDERS {
    string pat_mrn_id
    decimal csn
    decimal order_id
    datetime med_order_date
  }

  CCUDM_MRN_MERGE_HISTORY {
    string pat_mrn_id
    string merged_pat_mrn
  }

  CCUDM_PATIENT_INCLUSION_REASON {
    string pat_mrn_id
  }

  CCUDM_PFT {
    string pat_mrn_id
    decimal csn
    decimal pft_order_id
    datetime lab_rslt_collection_dttm
  }

  CCUDM_PROCEDURE_ORDERS {
    string pat_mrn_id
    decimal csn
    decimal order_id
    datetime prioritized_time
  }

  CCUDM_REGISTRY_COHORT_REPORT {
    bigint pat_mrn_id
    datetime adm_date
  }

  CCUDM_VACCINATIONS {
    decimal immune_id
    string pat_mrn_id
    datetime immune_date
    decimal csn
  }

  CCUDM_VAPING {
    string pat_mrn_id
    decimal hlv_id
    int line
  }

  CCUDM_VENTILATION {
    string pat_mrn_id
    string inpatient_data_id
    datetime vent_start_dttm
    datetime vent_end_dttm
  }

  %% =========================
  %% Neuro outcomes (linked by MRN)
  %% =========================
  NEURO_OUTCOMES {
    string unique_id_pk
    bigint epicmrn
  }

  %% =========================
  %% BedMaster + Etiometry telemetry (linked by MRN; optional run_id)
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER {
    string pk_pk
    bigint mrn
    string run_id
    datetime time
    string feature
    string value
  }

  ETIOMETRY_ANNOTATIONS {
    string mrn
    datetime event_at
    datetime created_at
    string event_type
  }

  ETIOMETRY_COMPUTED_DATA {
    bigint mrn
    string run_id
    datetime ts
  }

  ETIOMETRY_LABS {
    bigint mrn
    string run_id
    datetime performed
    string lab_name
    double val
  }

  ETIOMETRY_T3_DATA {
    bigint mrn
    string run_id
    datetime ts
  }

  %% =========================
  %% Relationships
  %% =========================
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_PATIENT_RUN : runid
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ELSO_CANNULA : runid
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

  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_ENCOUNTERS : pat_mrn_id
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ADT : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_COMORBIDITIES : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_DIALYSIS : csn
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_DIALYSIS_HISTORY : pat_mrn_id
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ECG : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_HOME_MEDICATIONS : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_IMAGING : csn
  CCUDM_IMAGING ||--o{ CCUDM_IMAGING_IMPRESSIONS : image_order_id
  CCUDM_ENCOUNTERS ||--o{ CCUDM_INCLUSION_ENCOUNTER : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_ISOLATION : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LAB_RESULTS : csn
  CCUDM_LAB_RESULTS ||--o{ CCUDM_LAB_RESULTS_SUSCEPTIBILITY : lab_order_id
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LDA : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ADMINISTRATION : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ORDERS : csn
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_MRN_MERGE_HISTORY : pat_mrn_id
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_PATIENT_INCLUSION_REASON : pat_mrn_id
  CCUDM_ENCOUNTERS ||--o{ CCUDM_PFT : csn
  CCUDM_ENCOUNTERS ||--o{ CCUDM_PROCEDURE_ORDERS : csn
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VACCINATIONS : pat_mrn_id
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VAPING : pat_mrn_id
  CCUDM_DEMOGRAPHICS ||--o{ CCUDM_VENTILATION : pat_mrn_id

  %% Cross-domain linkage by MRN (conceptual)
  PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_ECMO_LOG }o--|| CCUDM_DEMOGRAPHICS : pat_mrn_id
  CCUDM_DEMOGRAPHICS ||--o{ NEURO_OUTCOMES : mrn
  CCUDM_DEMOGRAPHICS ||--o{ PEDIATRICS_CRITICAL_CARE_ECMO_EPIC_BEDMASTER : mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_ANNOTATIONS : mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_COMPUTED_DATA : mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_LABS : mrn
  CCUDM_DEMOGRAPHICS ||--o{ ETIOMETRY_T3_DATA : mrn
