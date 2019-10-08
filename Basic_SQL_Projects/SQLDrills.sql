USE [db_zooTest2]
GO

SELECT * FROM tbl_habitat

SELECT species_name FROM tbl_species WHERE species_order LIKE '3';

SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <= 600.00;


SELECT
	a1.species_name, a2.nutrition_id
	FROM tbl_species a1
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
	WHERE species_nutrition <= 2206 AND species_nutrition >= 2202
;

SELECT
	a1.species_name AS 'Species Name:', a2.nutrition_type AS 'Nutrition Type:'
	FROM tbl_species a1
	INNER JOIN tbl_nutrition a2 ON a2.nutrition_id = a1.species_nutrition
;

SELECT a3.specialist_fname, a3.specialist_lname, a3.specialist_contact 
	FROM tbl_care a1
	INNER JOIN tbl_specialist a3 ON a3.specialist_id = a1.care_specialist
	INNER JOIN tbl_species a2 ON a2.species_care = a1.care_id
	WHERE species_name = 'penguin'
;

