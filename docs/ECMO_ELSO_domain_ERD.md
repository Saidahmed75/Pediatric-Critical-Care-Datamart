```mermaid
erDiagram

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

  elso_cannula {
    string patientid
    string runid
    int runno
  }

  elso_cannula_purpose {
    string patientid
    string runid
    int runno
  }

  elso_memblung {
    string patientid
    string runid
  }

  elso_equipment {
    string patientid
    string runid
    int runno
  }

  elso_pump {
    string patientid
    string runid
  }

  elso_diagnoses {
    string patientid
    string runid
    int runno
  }

  elso_carddx {
    string patientid
    string runid
    int runno
  }

  elso_pre_support {
    string patientid
    string runid
    int runno
  }

  elso_complications {
    string patientid
    string runid
    int runno
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

  %% Relationships
  elso_patient_run ||--|| ecmo_log : "runid"
  elso_patient_run ||--o{ elso_cannula : "runid"
  elso_patient_run ||--o{ elso_cannula_purpose : "runid"
  elso_patient_run ||--o{ elso_memblung : "runid"
  elso_patient_run ||--o{ elso_equipment : "runid"
  elso_patient_run ||--o{ elso_pump : "runid"
  elso_patient_run ||--o{ elso_diagnoses : "runid"
  elso_patient_run ||--o{ elso_carddx : "runid"
  elso_patient_run ||--o{ elso_pre_support : "runid"
  elso_patient_run ||--o{ elso_complications : "runid"
  elso_patient_run ||--o{ elso_organisms : "runid"
  elso_patient_run ||--o{ elso_procedures : "runid"
  elso_patient_run ||--o{ elso_rundetail : "runid"
