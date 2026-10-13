-- Creates the intermediate cql_concept table
--
-- Contains the concepts used by the CQL libraries (loaded from
-- inst/csv/cql_concepts.csv). The insert_<cdm_table>.sql scripts only
-- transfer stem_table records with these concepts into the CDM tables.
DROP TABLE IF EXISTS @cdm_schema.cql_concept;
CREATE TABLE IF NOT EXISTS @cdm_schema.cql_concept (
    cdm_table varchar(50) NOT NULL,
    concept_id int NOT NULL
);
