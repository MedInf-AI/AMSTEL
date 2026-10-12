-- INSERT records into MEASUREMENT from stem_table
-- WHERE domain_id = 21 (Measurement)
TRUNCATE @cdm_schema.measurement;
INSERT INTO @cdm_schema.measurement
(
    measurement_id,
    person_id,
    measurement_concept_id,
    measurement_date,
    measurement_datetime,
    measurement_time,
    measurement_type_concept_id,
    operator_concept_id,
    value_as_number,
    value_as_concept_id,
    unit_concept_id,
    range_low,
    range_high,
    provider_id,
    visit_occurrence_id,
    visit_detail_id,
    measurement_source_value,
    measurement_source_concept_id,
    unit_source_value,
    unit_source_concept_id,
    value_source_value,
    measurement_event_id,
    meas_event_field_concept_id
)
SELECT
    stem_table.id AS measurement_id,
    stem_table.person_id AS person_id,
    stem_table.concept_id AS measurement_concept_id,
    stem_table.start_date AS measurement_date,
    stem_table.start_datetime AS measurement_datetime,
    stem_table.measurement_time AS measurement_time,
    stem_table.type_concept_id AS measurement_type_concept_id,
    stem_table.operator_concept_id AS operator_concept_id,
    stem_table.value_as_number AS value_as_number,
    stem_table.value_as_concept_id AS value_as_concept_id,
    stem_table.unit_concept_id AS unit_concept_id,
    stem_table.range_low AS range_low,
    stem_table.range_high AS range_high,
    stem_table.provider_id AS provider_id,
    stem_table.visit_occurrence_id AS visit_occurrence_id,
    stem_table.visit_detail_id AS visit_detail_id,
    stem_table.source_value AS measurement_source_value,
    stem_table.source_concept_id AS measurement_source_concept_id,
    stem_table.unit_source_value AS unit_source_value,
    stem_table.unit_source_concept_id AS unit_source_concept_id,
    stem_table.value_source_value AS value_source_value,
    stem_table.event_id AS measurement_event_id,
    stem_table.event_field_concept_id AS meas_event_field_concept_id

FROM @cdm_schema.stem_table
WHERE stem_table.domain_id = 21 -- Measurement
      AND stem_table.concept_id IN (1092148, 1447532, 1447893, 1761753, 3000483, 3001501, 3003458, 3004077,
                                    3004501, 3004732, 3007828, 3008805, 3009097, 3011767, 3012410, 3013826,
                                    3015016, 3016166, 3017594, 3017707, 3018913, 3020491, 3020572, 3021470,
                                    3022803, 3024232, 3024882, 3025408, 3026238, 3026267, 3027801, 3029268,
                                    3029943, 3031266, 3033408, 3033780, 3034962, 3036277, 3038515, 3044242,
                                    3662219, 4029625, 4062985, 4099154, 4101694, 4105091, 4108448, 4165600,
                                    4216746, 4353713, 4353936, 4353946, 21490580, 21490752, 21490789, 21490854,
                                    36303816, 37151627, 42527140, 44782825, 44782826, 44782827) ;
