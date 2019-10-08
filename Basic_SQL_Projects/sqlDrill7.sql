CREATE DATABASE db_dogs

USE db_dogs
GO

CREATE TABLE tbl_dogOwners (
	owner_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	owner_fname VARCHAR(50) NOT NULL,
	owner_lname VARCHAR(50) NOT NULL,
	owner_contact VARCHAR(50) NOT NULL
);

INSERT INTO tbl_dogOwners
	(owner_fname, owner_lname, owner_contact)
	VALUES
	('hanna', 'kaier', '702-648-9872'),
	('anna', 'kozole', '435-640-3423'),
	('kyla', 'kozole', '435-659-6549'),
	('sarah', 'hunt', '801-645-9937')
;

SELECT * FROM tbl_dogOwners;

CREATE TABLE tbl_dogs (
	dog_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	dog_name VARCHAR(50) NOT NULL,
	dog_breed VARCHAR(50) NOT NULL,
	dog_age INT NOT NULL 
);

ALTER TABLE tbl_dogs
ADD dog_owner INT NOT NULL;

INSERT INTO tbl_dogs
	(dog_name, dog_breed, dog_age, dog_owner)
	VALUES
	('stella', 'mix shepherd', '4', 1),
	('madi', 'mix border collie', '13', 2),
	('mia', 'mix hound', '1', 2),
	('sakuu', 'karelian bear dog', '5', 3),
	('rose', 'mix cattledog terrier', '2', 3),
	('rusty', 'mix leonberger', '3', 4)
;

SELECT * FROM tbl_dogs;

SELECT
	a1.dog_name, a2.owner_fname, a2.owner_contact
	FROM tbl_dogs a1
	INNER JOIN tbl_dogOwners a2 ON a2.owner_id = a1.dog_owner
	WHERE owner_lname = 'kozole'
;