```mermaid
erDiagram

  %% Core patient abstraction
  patient {
    string PAT_MRN_ID
    string pat_id
  }

  %% EHR core
  ccudm_demographics {
    string PAT_MRN_ID
  }

  ccudm_encounters {
    string PAT_MRN_ID
    string CSN
    string INPATIENT_DATA_ID
  }

  ccudm_flowsheets {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  ccudm_lab_results {
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

  ccudm_ventilation {
    string PAT_MRN_ID
    string INPATIENT_DATA_ID
  }

  ccudm_comorbidities {
    string PAT_MRN_ID
    string CSN
  }

  ccudm_adt {
    string PAT_MRN_ID
    string CSN
  }

  %% ECMO / ELSO
  elso_patient_run {
    string patientid
    string runid
    int runno
  }

  ecmo_log {
    string runid
    string pat_mrn_id
    string inpatient_data_id
    string pat_enc_csn_id
  }

  elso_complications {
    string patientid
    string runid
    int runno
  }

  elso_cannula {
    string patientid
    string runid
    int runno
  }

  elso_memblung {
    string patientid
    string runid
  }

  elso_organisms {
    string patientid
    string runid
    int runno
  }

  elso_procedures {
    string patientid
    string runid
    int runno
  }

  elso_rundetail {
    string patientid
    string runid
    int runno
  }

  %% Telemetry
  bedmaster {
    string mrn
    string run_id
    string time
  }

  etiometry_computed_data {
    string mrn
    string run_id
    string timestamp
  }

  etiometry_labs {
    string mrn
    string run_id
    string performed
  }

  etiometry_annotations {
    string mrn
    string event_at
  }

  %% Neuro
  neuro_outcomes {
    string epicmrn
    string pat_id
    string previousstudyid
  }

  %% EHR relationships
  patient ||--o{ ccudm_demographics : "PAT_MRN_ID"
  patient ||--o{ ccudm_encounters   : "PAT_MRN_ID"

  ccudm_encounters ||--o{ ccudm_flowsheets : "INPATIENT_DATA_ID"
  ccudm_encounters ||--o{ ccudm_lab_results : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_medication_orders : "PAT_MRN_ID, CSN"
  ccudm_medication_orders ||--o{ ccudm_medication_administration : "ORDER_ID"
  ccudm_encounters ||--o{ ccudm_ventilation : "INPATIENT_DATA_ID"
  ccudm_encounters ||--o{ ccudm_comorbidities : "PAT_MRN_ID, CSN"
  ccudm_encounters ||--o{ ccudm_adt : "PAT_MRN_ID, CSN"

  %% ELSO and ECMO log
  elso_patient_run ||--|| ecmo_log : "runid"
  ecmo_log ||--|| patient          : "pat_mrn_id = PAT_MRN_ID"
  ecmo_log ||--o{ ccudm_encounters : "pat_enc_csn_id = CSN"
  ecmo_log ||--o{ ccudm_flowsheets : "inpatient_data_id"

  elso_patient_run ||--o{ elso_complications : "runid"
  elso_patient_run ||--o{ elso_cannula : "runid"
  elso_patient_run ||--o{ elso_memblung : "runid"
  elso_patient_run ||--o{ elso_organisms : "runid"
  elso_patient_run ||--o{ elso_procedures : "runid"
  elso_patient_run ||--o{ elso_rundetail : "runid"

  %% Telemetry
  patient ||--o{ bedmaster : "mrn = PAT_MRN_ID"
  patient ||--o{ etiometry_computed_data : "mrn = PAT_MRN_ID"
  patient ||--o{ etiometry_labs : "mrn = PAT_MRN_ID"
  patient ||--o{ etiometry_annotations : "mrn = PAT_MRN_ID"

  elso_patient_run ||--o{ bedmaster : "run_id"
  elso_patient_run ||--o{ etiometry_computed_data : "run_id"
  elso_patient_run ||--o{ etiometry_labs : "run_id"

  %% Neuro outcomes
  neuro_outcomes ||--|| patient : "epicmrn = PAT_MRN_ID"
  neuro_outcomes }o--|| elso_patient_run : "via pat_id / previousstudyid"
