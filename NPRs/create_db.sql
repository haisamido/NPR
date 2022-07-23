
-- CREATE npr schema
CREATE SCHEMA IF NOT EXISTS NPR AUTHORIZATION postgres;
SET search_path TO public,npr;

CREATE TABLE mission_classes (
  id SERIAL PRIMARY KEY,
  mission_class TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE requirement_documents (
  id SERIAL PRIMARY KEY,
  requirement_document TEXT NOT NULL UNIQUE,
  effective_date DATE NOT NULL,
  expiration_date DATE NOT NULL,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE requirement_document_sections (
  id SERIAL PRIMARY KEY,
  requirement_document TEXT NOT NULL, FOREIGN KEY (requirement_document) REFERENCES public.requirement_documents (requirement_document),
  requirement_document_section TEXT NOT NULL UNIQUE,
  requirement_document_text TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT,
  UNIQUE(requirement_document,requirement_document_section,requirement_document_text)
);

CREATE TABLE requirement_document_section_hierarchy (
  id SERIAL PRIMARY KEY,
  requirement_document TEXT NOT NULL, FOREIGN KEY (requirement_document) REFERENCES public.requirement_documents (requirement_document),
  requirement_document_parent_section TEXT NOT NULL, FOREIGN KEY (requirement_document_parent_section) REFERENCES public.requirement_document_sections (requirement_document_section),
  requirement_document_section TEXT NOT NULL, FOREIGN KEY (requirement_document_section) REFERENCES public.requirement_document_sections (requirement_document_section),
  UNIQUE(requirement_document,requirement_document_parent_section,requirement_document_section)
);

CREATE TABLE requirements_in_document (
  id SERIAL PRIMARY KEY,
  requirement_in_document TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE requirement_compliances (
  id SERIAL PRIMARY KEY,
  requirement_compliance TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE software_classifications (
  id SERIAL PRIMARY KEY,
  software_classification TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE software_class_authorities (
  id SERIAL PRIMARY KEY,
  software_class_authority TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT 
);