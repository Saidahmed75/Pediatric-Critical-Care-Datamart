```mermaid
erDiagram
  %% =========================
  %% High level / domain view
  %% =========================

  PATIENT {
    string PAT_MRN_ID
    string PAT_ID
  }

  %% ---------
  %% EHR domain (CCUDM)
  %% ---------
  CCUDM_DEMOGRAPHICS {
    string PAT_MRN_ID
  }

  CCUDM_ENCOUNTERS {
    string PAT_MRN_ID
    decimal CSN
    string INPATIENT_DATA_ID
  }

  CCUDM_FLOWSHEETS {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  CCUDM_LAB_RESULTS {
    string PAT_MRN_ID
    decimal CSN
    decimal LAB_ORDER_ID
  }

  CCUDM_MEDICATION_ORDERS {
    string PAT_MRN_ID
    decimal CSN
    decimal ORDER_ID
  }

  CCUDM_MEDICATION_ADMINISTRATION {
    string PAT_MRN_ID
    decimal CSN
    decimal ORDER_ID
  }

  CCUDM_VENTILATION {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  %% ---------
  %% ECMO core + ECMO-ELSO domain
  %% ---------
  ECMO_LOG {
    string runid
    string pat_mrn_id
    string inpatient_data_id
    string pat_enc_csn_id
  }

  ELSO_PATIENT_RUN {
    string runid
    int runno
    string patientid
  }

  ELSO_CANNULA {
    string cannulapk
    string runid
    int runno
  }

  ELSO_COMPLICATIONS {
    string complicpk
    string runid
    int runno
  }

  ELSO_DIAGNOSES {
    string diagnosespk
    string runid
    int runno
  }

  ELSO_ORGANISMS {
    string orgpk
    string runid
    int runno
  }

  ELSO_PROCEDURES {
    string procedurepk
    string runid
    int runno
  }

  ELSO_RUNDETAIL {
    string rundetailid
    string runid
    int runno
  }

  %% ---------
  %% Telemetry domain (BedMaster + Etiometry)
  %% ---------
  BEDMASTER {
    string bedmaster_row_id
    bigint mrn
    string run_id
    datetime time
  }

  ETIOMETRY_T3_DATA {
    bigint mrn
    string run_id
    datetime ts
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
  }

  ETIOMETRY_ANNOTATIONS {
    string mrn
    datetime event_at
  }

  %% ---------
  %% Neuro outcomes domain
  %% ---------
  NEURO_OUTCOMES {
    string unique_id
    bigint epicmrn
    string pat_id
  }

  %% =========================
  %% Relationships (domain-level)
  %% =========================

  %% Patient anchor to EHR
  PATIENT ||--o{ CCUDM_DEMOGRAPHICS : "PAT_MRN_ID"
  PATIENT ||--o{ CCUDM_ENCOUNTERS   : "PAT_MRN_ID"

  CCUDM_ENCOUNTERS ||--o{ CCUDM_FLOWSHEETS        : "INPATIENT_DATA_ID"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_LAB_RESULTS       : "CSN"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_MEDICATION_ORDERS : "CSN"
  CCUDM_MEDICATION_ORDERS ||--o{ CCUDM_MEDICATION_ADMINISTRATION : "ORDER_ID"
  CCUDM_ENCOUNTERS ||--o{ CCUDM_VENTILATION       : "INPATIENT_DATA_ID"

  %% ECMO core to ECMO-ELSO
  ECMO_LOG ||--o{ ELSO_PATIENT_RUN   : "runid"
  ECMO_LOG ||--o{ ELSO_CANNULA       : "runid"
  ECMO_LOG ||--o{ ELSO_COMPLICATIONS : "runid"
  ECMO_LOG ||--o{ ELSO_DIAGNOSES     : "runid"
  ECMO_LOG ||--o{ ELSO_ORGANISMS     : "runid"
  ECMO_LOG ||--o{ ELSO_PROCEDURES    : "runid"
  ECMO_LOG ||--o{ ELSO_RUNDETAIL     : "runid"

  %% Cross-domain linkage via identifiers
  ECMO_LOG }o--|| PATIENT         : "pat_mrn_id = PAT_MRN_ID"
  ECMO_LOG }o--|| CCUDM_ENCOUNTERS : "pat_enc_csn_id = CSN"
  ECMO_LOG }o--|| CCUDM_FLOWSHEETS : "inpatient_data_id = INPATIENT_DATA_ID"

  %% Patient to telemetry (MRN)
  PATIENT ||--o{ BEDMASTER               : "PAT_MRN_ID = mrn"
  PATIENT ||--o{ ETIOMETRY_T3_DATA       : "PAT_MRN_ID = mrn"
  PATIENT ||--o{ ETIOMETRY_COMPUTED_DATA : "PAT_MRN_ID = mrn"
  PATIENT ||--o{ ETIOMETRY_LABS          : "PAT_MRN_ID = mrn"
  PATIENT ||--o{ ETIOMETRY_ANNOTATIONS   : "PAT_MRN_ID = mrn"

  %% Optional ECMO run linkage into telemetry via run_id (when present)
  ELSO_PATIENT_RUN ||--o{ BEDMASTER               : "run_id"
  ELSO_PATIENT_RUN ||--o{ ETIOMETRY_T3_DATA       : "run_id"
  ELSO_PATIENT_RUN ||--o{ ETIOMETRY_COMPUTED_DATA : "run_id"
  ELSO_PATIENT_RUN ||--o{ ETIOMETRY_LABS          : "run_id"

  %% Neuro outcomes linkage (MRN + optional PAT_ID)
  PATIENT ||--o{ NEURO_OUTCOMES : "PAT_MRN_ID = epicmrn"
