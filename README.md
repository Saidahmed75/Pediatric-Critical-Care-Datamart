# Pediatric Critical Care Datamart

## Overview

This repository documents the design, structure, and data model of a comprehensive Pediatric Critical Care Datamart developed to support high-resolution clinical, physiologic, and outcomes-focused research in the pediatric intensive care unit (ICU). The datamart integrates multimodal electronic health record (EHR), telemetry, and domain-specific data sources, with particular emphasis on extracorporeal membrane oxygenation (ECMO) populations.

The primary goal of this repository is to provide transparent, reproducible documentation of the datamart schema, entity relationships, and data availability characteristics that underpin downstream analytics, machine learning model development, and clinical decision support research.

---

## Repository Structure

The repository is organized to separate documentation, schema definitions, analysis code, and publication figures:

├── analysis/      # Analysis and figure-generation code
├── docs/          # Markdown documentation and ERDs
├── figures/       # Publication-ready figures (PDF)
├── schema/        # Domain-level schema organization
├── LICENSE
└── README.md

### Key Directories

- **docs/**  
  Contains high-level and domain-specific Entity Relationship Diagrams (ERDs) and supporting documentation describing the datamart structure.

- **figures/**  
  Includes publication-ready figures demonstrating data density, temporal granularity, and schema summaries used in manuscripts and supplemental materials.

- **analysis/**  
  Contains reproducible analysis scripts used to generate figures and summarize data availability characteristics.

- **schema/**  
  Organizes domain-specific schema components (e.g., EHR, telemetry, ECMO/ELSO, neurologic outcomes).

---

## Data Model and ERDs

The datamart schema is documented using modular ERDs to improve clarity and interpretability:

- **High-level datamart overview:**  
  `docs/high_level_ERD.md`

- **Combined ERD:**  
  `docs/Combined_ERD.md`

- **Domain-specific ERDs:**  
  - EHR domain: `docs/EHR_domain_ERD.md`  
  - Telemetry domain: `docs/telemetry_domain_ERD.md`  
  - ECMO / ELSO domain: `docs/ECMO_ELSO_domain_ERD.md`  
  - Neurologic outcomes domain: `docs/neuro_outcomes_domain_ERD.md`

A consolidated ERD is also provided in PDF format in the `figures/` directory.

---

## Figures and Data Availability Characterization

The repository includes figures characterizing:

- Day-level and within-day data density across modalities
- Differences in data availability between ECMO and non-ECMO encounters
- Temporal granularity of telemetry, laboratory, medication, imaging, and flowsheet data

These figures are intended to support transparency around data completeness, resolution, and multimodal overlap in the datamart.

---

## Intended Use

This repository is intended for:

- Investigators developing predictive models using pediatric ICU data
- Researchers studying ECMO and other high-acuity critical care populations
- Methodologic work in clinical informatics and data engineering
- Reviewers and collaborators seeking datamart schema-level transparency

The repository **does not contain patient-level data**. All content is limited to schema documentation, summary figures, and analysis code.

---

## Reproducibility and Extensibility

The datamart schema is designed to support:

- Retrospective cohort construction
- Prospective cohort identification
- Longitudinal, high-resolution time-series analyses
- Integration of additional ICU data modalities over time

Analysis scripts are provided to facilitate reproducibility of reported figures and summary statistics.

---

## Citation

If you use or reference this repository, please cite it as:

> Said A. *Pediatric Critical Care Datamart: Schema and Documentation*. GitHub repository, 2025.

A `CITATION.cff` file is provided to support automated citation via GitHub.

https://github.com/Saidahmed75/Pediatric-Critical-Care-Datamart.git

---

## License

This repository is distributed under the terms of the license specified in the `LICENSE` file. The license applies to documentation, figures, and code contained herein.

---

## Contact

For questions, collaboration, or methodologic inquiries related to this datamart, please contact the repository owner via GitHub.

---
