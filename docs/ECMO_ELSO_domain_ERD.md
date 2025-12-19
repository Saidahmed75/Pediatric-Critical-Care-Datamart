```mermaid
erDiagram

  pediatrics_critical_care_ecmo_epic_ecmo_log {
    string runid PK
    int    year
    string mode
    string unit
    int    pat_mrn_id
    string inpatient_data_id
    timestamp date_on_ecmo
    string discharge_disposition
  }

  pediatrics_critical_care_ecmo_epic_elso_patient_run {
    string runid PK
    string patientid
    int    runno
    int    ageyears
    string sex
    string supporttype
    int    hoursecmo
  }

  pediatrics_critical_care_ecmo_epic_elso_cannula {
    string cannulapk PK
    string runid FK
    int    runno
    int    cannulaid
    string cannuladescription
    string site
    string size
  }

  pediatrics_critical_care_ecmo_epic_elso_cannula_purpose {
    string canpurid PK
    string runid FK
    int    runno
    timestamp starttime
    timestamp endtime
    int    purposereason
  }

  pediatrics_critical_care_ecmo_epic_elso_carddx {
    string carddxpk PK
    string runid FK
    int    runno
    int    icd9
    string description
  }

  pediatrics_critical_care_ecmo_epic_elso_complications {
    string complicpk PK
    string runid FK
    int    runno
    int    code
    string description
    timestamp time
  }

  pediatrics_critical_care_ecmo_epic_elso_diagnoses {
    string diagnosespk PK
    string runid FK
    int    runno
    string icd10code
    string icd10description
    string primarydiagnosis
  }

  pediatrics_critical_care_ecmo_epic_elso_equipment {
    string equippk PK
    string runid FK
    int    runno
    string heatexchangername
    string hemofiltername
    string temperatureregulationname
  }

  pediatrics_critical_care_ecmo_epic_elso_memblung {
    string membpk PK
    string runid FK
    int    membranelungid
    string membranelungname
    string manufacturer
  }

  pediatrics_critical_care_ecmo_epic_elso_organisms {
    string orgpk PK
    string runid FK
    int    runno
    int    organismid
    string organismname
    timestamp timeon
    timestamp timeoff
  }

  pediatrics_critical_care_ecmo_epic_elso_pre_support {
    string prsupppk PK
    string runid FK
    int    runno
    int    supportcodeid
    string description
  }

  pediatrics_critical_care_ecmo_epic_elso_procedures {
    string procedurepk PK
    string runid FK
    int    runno
    int    cptcode
    string cptdescription
    timestamp date
  }

  pediatrics_critical_care_ecmo_epic_elso_pump {
    string pumppk PK
    string runid FK
    int    pumpid
    string bloodpumpname
    string manufacturer
  }

  pediatrics_critical_care_ecmo_epic_elso_rundetail {
    string rundetailid PK
    string runid FK
    int    runno
    int    hoursrundetail
    timestamp starttime
    timestamp endtime
    string description
  }

  %% Relationships
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--|| pediatrics_critical_care_ecmo_epic_elso_patient_run : "runid"

  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_cannula : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_cannula_purpose : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_carddx : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_complications : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_diagnoses : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_equipment : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_memblung : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_organisms : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_pre_support : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_procedures : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_pump : "runid"
  pediatrics_critical_care_ecmo_epic_ecmo_log ||--o{ pediatrics_critical_care_ecmo_epic_elso_rundetail : "runid"
