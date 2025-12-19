```mermaid
erDiagram

  bedmaster {
    string mrn
    string run_id
    string time
  }

  etiometry_t3_data {
    string timestamp
  }

  etiometry_computed_data {
    string mrn
    string run_id
    string timestamp
  }

  etiometry_annotations {
    string mrn
    string event_at
  }

  etiometry_labs {
    string mrn
    string run_id
    string performed
  }

  %% Relationships (all via MRN)
  bedmaster }o--|| etiometry_computed_data : "mrn"
  bedmaster }o--|| etiometry_labs : "mrn"
  bedmaster }o--|| etiometry_annotations : "mrn"

  %% ECMO run linkage
  bedmaster ||--o{ etiometry_computed_data : "run_id"
  bedmaster ||--o{ etiometry_labs : "run_id"
