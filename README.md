# T1D-Exchange-OMOP-Mapping
Mapping the T1D Exchange to OMOP for interoperability and cross-network collaboration 

This repository contains the draft mapping of the T1D Exchange (T1DX) data model to the OMOP Common Data Model (CDM). The goal of this effort is to support standardized representation of T1D Exchange data within the OHDSI ecosystem, enabling interoperability, reproducible analytics, and federated research across organizations using OMOP.

**Current Progress**

The following work has been completed:

1. Core T1DX-to-OMOP mapping development for the primary T1D Exchange data tables.
2. Reverse mapping logic documenting how OMOP concepts and fields can be traced back to their originating T1DX elements.
3. Creation of machine-readable T1DX table specifications and mapping documentation to support transparency, review, and future automated implementation.
4. Initial identification of OMOP standard concepts and mapping patterns applicable to the T1DX data model.

**Project Status**

This mapping should be considered a draft and ETL revisions will occur. Additional work is needed before the mapping can be considered production-ready.

**Key next steps include:**

a. Validation of the current mappings.
b. Review and alignment with T1D Exchange stakeholders to ensure agreement on mapping decisions and intended data representation.
c. Evaluation of opportunities for standardization of select concepts used in the core table mappings.
d. Continued development and standardization of OMOP concepts required for diabetes-specific data elements and tables that are not yet fully represented within the OMOP vocabulary ecosystem.

**Related Vocabulary Development**
Work to support diabetes-specific standard concepts and vocabulary enhancements is being actively developed within the OHDSI Vocabulary repository:

[OHDSI Vocabulary t1dx branch](https://github.com/OHDSI/Vocabulary-v5.0/tree/t1dx/T1DX)

The outcomes of that vocabulary work may inform future revisions to this mapping and enable more complete representation of diabetes-specific clinical information within OMOP.

Disclaimer

This repository represents an ongoing collaborative effort and should not be considered a final or endorsed mapping specification. Mapping decisions, vocabulary assignments, and implementation guidance may change as validation, community review, and vocabulary development progress.
