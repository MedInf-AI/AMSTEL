-- INSERT records into DEVICE_EXPOSURE from stem_table
-- WHERE domain_id = 17	(Device)
TRUNCATE @cdm_schema.device_exposure;
INSERT INTO @cdm_schema.device_exposure
(
    device_exposure_id,
    person_id,
    device_concept_id,
    device_exposure_start_date,
    device_exposure_start_datetime,
    device_exposure_end_date,
    device_exposure_end_datetime,
    device_type_concept_id,
    unique_device_id,
    production_id,
    quantity,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    device_source_value,
    device_source_concept_id,
    unit_concept_id,
    unit_source_value,
    unit_source_concept_id
)
SELECT
    stem_table.id AS device_exposure_id,
    stem_table.person_id AS person_id,
    stem_table.concept_id AS device_concept_id,
    stem_table.start_date AS device_exposure_start_date,
    stem_table.start_datetime AS device_exposure_start_datetime,
    stem_table.end_date AS device_exposure_end_date,
    stem_table.end_datetime AS device_exposure_end_datetime,
    stem_table.type_concept_id AS device_type_concept_id,
    NULL AS unique_device_id,
    NULL AS production_id,
    stem_table.quantity AS quantity,
    stem_table.provider_id AS provider_id,
    stem_table.visit_occurrence_id AS visit_occurrence_id,
    NULL AS visit_detail_id,
    stem_table.source_value AS device_source_value,
    stem_table.source_concept_id AS device_source_concept_id,
    stem_table.unit_concept_id AS unit_concept_id,
    stem_table.unit_source_value AS unit_source_value,
    stem_table.unit_source_concept_id AS unit_source_concept_id

FROM @cdm_schema.stem_table
WHERE stem_table.domain_id = 17	-- Device
      AND stem_table.concept_id IN (607720, 3661742, 4097216, 4148025, 4148969, 4148970, 4149922, 4149923, 4161814,
                                    4179206, 4222389, 4223308, 4224877, 4225181, 4327418, 37162306, 37167492,
                                    37167946, 40482049, 40486643, 42709987, 42709989, 45758564, 45761574, 45763195,
                                    45767499, 45773232);
