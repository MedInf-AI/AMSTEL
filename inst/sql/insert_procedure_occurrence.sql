-- INSERT records into PROCEDURE_OCCURRENCE from stem_table
-- WHERE domain_id = 10 (Procedure)
TRUNCATE @cdm_schema.procedure_occurrence;
INSERT INTO @cdm_schema.procedure_occurrence
(
    procedure_occurrence_id,
    person_id,
    procedure_concept_id,
    procedure_date,
    procedure_datetime,
    procedure_end_date,
    procedure_end_datetime,
    procedure_type_concept_id,
    modifier_concept_id,
    quantity,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    procedure_source_value,
    procedure_source_concept_id,
    modifier_source_value
)
SELECT
    stem_table.id AS procedure_occurrence_id,
    stem_table.person_id AS person_id,
    stem_table.concept_id AS procedure_concept_id,
    stem_table.start_date AS procedure_date,
    stem_table.start_datetime AS procedure_datetime,
    stem_table.end_date AS procedure_end_date,
    stem_table.end_datetime AS procedure_end_datetime,
    stem_table.type_concept_id AS procedure_type_concept_id,
    stem_table.modifier_concept_id AS modifier_concept_id,
    stem_table.quantity AS quantity,
    stem_table.provider_id AS provider_id,
    stem_table.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    stem_table.source_value AS procedure_source_value,
    stem_table.source_concept_id AS procedure_source_concept_id,
    stem_table.modifier_source_value AS modifier_source_value

FROM @cdm_schema.stem_table
WHERE
  stem_table.domain_id = 10 -- Procedure
  AND (
    stem_table.quantity > 0 OR stem_table.quantity IS NULL
  )
  AND stem_table.concept_id IN (1242274, 4012607, 4040262, 4049846, 4051326, 4051329, 4051330, 4055375,
                                4072515, 4148972, 4150627, 4158838, 4204159, 4245036, 4308797, 37016972,
                                37152363, 37152364, 37152384, 37152385, 37152386, 37152387, 37152388, 37152389,
                                37152390, 37152408, 37152409, 37152410, 37152411, 37152412, 37158404, 40491848,
                                46271857, 46271859, 46272439, 46272440, 46272565);
