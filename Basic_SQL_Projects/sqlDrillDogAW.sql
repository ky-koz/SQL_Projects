USE db_dogs

-- make addition table for two joins
CREATE TABLE tbl_dogDetails (
	det_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	toy_type varchar(50) NOT NULL,
	food_type varchar(50) NOT NULL,
	treat_type varchar(50) NOT NULL,
	bed_type varchar(50) NOT NULL,
	dog_id varchar(50) NOT NULL
);

SELECT * FROM tbl_dogs;

INSERT INTO tbl_dogDetails
	(toy_type, food_type, treat_type, bed_type, dog_id)
	VALUES
	('no toy', 'kibble with water', 'cheese, gf, no chicken or beef', 'human bed, cold floor, XL dog bed', '4'),
	('ball or tug', 'dry kibble', 'anything', 'XL dog bed, human bed', '6'),
	('anything', 'kibble with water', 'dog treats, meat, cheese', 'cat bed, dog bed, chairs, human bed', '5'),
	('tug toys', 'kibble with wet food and water','dog treats, meat, cheese', 'M-XL dog bed', '2'),
	('anything', 'kibble with wet food and water','dog treats, meat, cheese', 'M-XL dog bed', '3'),
	('anything', 'dry kibble', 'dog treats, meat, cheese', 'M-XL dog bed, human bed', '1')
;
SELECT * FROM tbl_dogDetails;

-- create proc with two joins and two parameters
CREATE PROC dbo_uspFindFood @food nvarchar(50) = NULL, @treats nvarchar(50) = NULL
AS
SELECT
a1.dog_name, a3.owner_lname, a2.food_type, a2.treat_type
FROM tbl_dogs a1
INNER JOIN tbl_dogDetails a2 ON a2.dog_id = a1.dog_id
INNER JOIN tbl_dogOwners a3 ON a3.owner_id = a1.dog_owner
WHERE food_type LIKE '%' + ISNULL(@food, food_type) + '%'
AND treat_type like '%' + ISNULL(@treats, treat_type) + '%'
GO

-- execute proc dbo_uspFindFood
EXEC [dbo].[dbo_uspFindFood] @food = 'wet';

EXEC [dbo].[dbo_uspFindFood] @treats = 'cheese';