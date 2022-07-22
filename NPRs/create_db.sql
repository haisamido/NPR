
-- CREATE npr schema
CREATE SCHEMA IF NOT EXISTS NPR AUTHORIZATION postgres;
SET search_path TO public,npr;

CREATE TABLE npr.mission_classes (
  id SERIAL PRIMARY KEY,
  mission_class TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE npr.requirement_names (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE npr.software_classes (
  id SERIAL PRIMARY KEY,
  software_class TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE npr.software_class_authorities (
  id SERIAL PRIMARY KEY,
  software_class_authority TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT 
);

CREATE TABLE npr.npr_sections (
  id SERIAL PRIMARY KEY,
  npr_section TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

CREATE TABLE npr.compliances (
  id SERIAL PRIMARY KEY,
  compliance TEXT NOT NULL UNIQUE,
  metadata jsonb NOT NULL default '{}'::jsonb,
  description TEXT,
  comment TEXT
);

