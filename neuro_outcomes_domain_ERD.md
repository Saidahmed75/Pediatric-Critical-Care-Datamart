```mermaid
erDiagram

  neuro_outcomes {
    string epicmrn
    string pat_id
    string previousstudyid
  }

  patient {
    string PAT_MRN_ID
    string pat_id
  }

  elso_patient_run {
    string patientid
    string runid
  }

  %% Relationships
  neuro_outcomes ||--|| patient : "epicmrn = PAT_MRN_ID"
  neuro_outcomes }o--|| elso_patient_run : "via pat_id / previousstudyid"
