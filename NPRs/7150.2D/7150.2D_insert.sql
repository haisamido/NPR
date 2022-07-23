
INSERT INTO requirement_documents (requirement_document,effective_date,expiration_date,metadata) VALUES ('7150.2D','2022-03-08','2027-03-08','{"source":"https://nodis3.gsfc.nasa.gov/npg_img/N_PR_7150_002D_/N_PR_7150_002D_.pdf"}');

INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','2.0','Roles, Responsibilities, and Principles Related to Tailoring of the Requirements');
INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','2.1','Roles and Responsibilities Associated with this Directive');
INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','2.1.1','The NASA Office of the Chief Engineer (OCE).');
INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','2.1.1.1','The NASA OCE shall lead and maintain a NASA Software Engineering Initiative to advance software engineering practices. [SWE-002]');
INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','2.1.1.2','The NASA OCE shall periodically benchmark each Center’s software engineering capability against requirements in this directive. [SWE-004]');

INSERT INTO requirement_document_section_hierarchy (requirement_document,requirement_document_parent_section,requirement_document_section) VALUES ('7150.2D','2.0','2.1');
INSERT INTO requirement_document_section_hierarchy (requirement_document,requirement_document_parent_section,requirement_document_section) VALUES ('7150.2D','2.1','2.1.1');
INSERT INTO requirement_document_section_hierarchy (requirement_document,requirement_document_parent_section,requirement_document_section) VALUES ('7150.2D','2.1.1','2.1.1.1');
INSERT INTO requirement_document_section_hierarchy (requirement_document,requirement_document_parent_section,requirement_document_section) VALUES ('7150.2D','2.1.1','2.1.1.2');

INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','3.0','Software Management Requirements');
INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','3.1','Software Life Cycle Planning');
INSERT INTO requirement_document_sections (requirement_document,requirement_document_section,requirement_document_text) VALUES ('7150.2D','3.1.1','Software life cycle planning covers the software aspects of a project from inception through retirement. The software life cycle planning is an organizing process that considers the software as a whole and provides the planning activities required to ensure a coordinated, well-engineered process for defining and implementing project activities. These processes, plans, and activities are coordinated within the project. At project conception, software needs for the project are analyzed, including acquisition, supply, development, operation, maintenance, retirement, decommissioning, and supporting activities and processes. The software effort is scoped, the development processes defined, measurements defined, and activities are documented in software planning documents.');

INSERT INTO requirement_document_section_hierarchy (requirement_document,requirement_document_parent_section,requirement_document_section) VALUES ('7150.2D','3.0','3.1');
INSERT INTO requirement_document_section_hierarchy (requirement_document,requirement_document_parent_section,requirement_document_section) VALUES ('7150.2D','3.1','3.1.1');

