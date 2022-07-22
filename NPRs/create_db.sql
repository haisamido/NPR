
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

CREATE TABLE requirement_names (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE,
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

CREATE TABLE sections (
  id SERIAL PRIMARY KEY,
  section TEXT NOT NULL UNIQUE,
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

