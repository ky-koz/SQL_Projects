USE MASTER
go
DROP DATABASE db_library
go
CREATE DATABASE db_library
go
USE db_library
go

CREATE TABLE library_branch (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	BranchName VARCHAR (50) NOT NULL,
	Address VARCHAR (50) NOT NULL
);

CREATE TABLE book_copies (
	BookID INT NOT NULL, 
	BranchID INT NOT NULL,
	Number_Of_Copies INT NOT NULL 
);

CREATE TABLE publisher (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR (50) NOT NULL,
	Phone VARCHAR (50) NOT NULL
);

/*
ALTER TABLE publisher
ALTER COLUMN Phone new_data_type VARCHAR (50) NOT NULL;
*/

CREATE TABLE book_loans (
	BookID INT NOT NULL, 
	BranchID INT NOT NULL, 
	CardNo INT NOT NULL, 
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

CREATE TABLE books (
	BookID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Title VARCHAR (50) NOT NULL,
	PublisherName VARCHAR (50) NOT NULL
);

CREATE TABLE borrower (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY(100,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE book_authors (
	BookID INT NOT NULL,
	AuthorName VARCHAR (50) NOT NULL
);


--There is a library branch called 'Sharpstown' and one called 'Central'.
-- There are at least 4 branches in the LIBRARY_BRANCH table.

INSERT INTO library_branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '9128 Winston Ln'),
	('Central', '13 Central Rd'),
	('Eastgate', '1100 S 200 E'),
	('Milltown', '142 James St')
;

SELECT * FROM library_branch;

INSERT INTO publisher
	(PublisherName, Address, Phone)
	VALUES
	('Simon & Schuster', '1230 6th Ave, New York, NY 10020', '(212) 698-7000'),
	('Little, Brown and Company', '1290 6th Ave, New York, NY 10104', '(212) 364-1010'),
	-- ('Little, Brown and Company', '1290 6th Ave, New York, NY 10104', '212-364-1010'),
	('Random House Publishing Group', '1745 Broadway, Manthattan, NY 10019', '(800) 733-300'),
	('G.P. Putnams Sons', '375 Hudson St. New York, NY 10014', '(212) 366-2000'),
	('HarperCollins','195 Broadway, New York, NY 10007','(212) 207-7000'),
	('The Russian Messenger','','' ),
	('Bloomsbury','1385 Broadway, 5th Floor, New York, NY 10018', '(888) 330-8477'),
	('Frederick A. Stokes', '',''),
	('Doubleday','1745 Broadway New York, NY 10019', '(212) 940-7390'),
	('Richard Bentley', '', ''),
	-- ('Random House Publishing Group', '1745 Broadway, Manthattan, NY 10019', '800-733-300),
	('Henry Holt & Co', '120 Broadway, New York, NY 10271','(646) 307-5095')
;
SELECT * FROM publisher;

--There is a book called 'The Lost Tribe' found in the 'Sharpstown' branch.
--There are at least 20 books in the BOOK table.
INSERT INTO books
	(Title, PublisherName)
	VALUES
	('The Stand', 'Simon & Schuster'),
	('Talking to Strangers','Little, Brown and Company'),
	('The Goldfinch','Little, Brown and Company'),
	('Fierce Invalids Home from Hot Climates','Random House Publishing Group'),
	('Where the Crawdads Sing','G.P. Putnams Sons'),
	('Good Omens','HarperCollins'),
	('Anna Karenina','The Russian Messenger'),
	('Harry Potter and the Goblet of Fire','Bloomsbury'),
	('The Secret Garden','Frederick A. Stokes'),
	('Origin','Doubleday'),
	('Oliver Twist','Richard Bentley'),
	('Ready Player One','Random House Publishing Group'),
	('The Lost Tribe','Henry Holt & Co'),
	('IT', 'Simon & Schuster'),
	('The Shining', 'Simon & Schuster'),
	('Dreamcatcher', 'Simon & Schuster'),
	('Tipping Point', 'Little, Brown and Company'),
	('Outsiders', 'Little, Brown and Company'),
	('The Secret History', 'Little, Brown and Company'),
	('Another Roadside Attraction', 'Random House Publishing Group')
;
SELECT * FROM books;

--There are at least 10 authors in the BOOK_AUTHORS table.
INSERT INTO book_authors
	(BookID, AuthorName)
	VALUES
	(1,'Stephen King'), 
	(2,'Malcolm Gladwell'), 
	(3,'Donna Tart'), 
	(4,'Tom Robbins'), 
	(5,'Delia Owens'), 
	(6,'Neil Gaiman'), 
	(7,'Leo Tolstoy'), 
	(8,'JK Rowling'), 
	(9,'Frances Hodgson Burnett'), 
	(10,'Dan Brown'), 
	(11,'Charles Dickens'), 
	(12,'Ernest Cline'), 
	(13, 'Mark Lee'),
	(14, 'Stephen King'),
	(15, 'Stephen King'),
	(16, 'Stephen King'),
	(17,'Malcolm Gladwell'), 
	(18,'Malcolm Gladwell'), 
	(19, 'Donna Tart'),
	(20, 'Tom Robbins')
;
SELECT * FROM book_authors;

--There must be at least two books written by 'Stephen King' located at the 'Central' branch.
-- Each library branch has at least 10 book titles, and at least two copies of each of those titles.
INSERT INTO book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1,1,2),
	(1,2,2),
	(1,3,2),
	(1,4,2),
	(2,1,2),
	(2,2,2),
	(2,3,2),
	(2,4,2),
	(3,1,2),
	(3,2,2),
	(3,3,2),
	(3,4,2),
	(4,1,2),
	(4,2,2),
	(4,3,2),
	(4,4,2),
	(5,1,2),
	(5,2,2),
	(5,3,2),
	(5,4,2),
	(6,1,2),
	(6,2,2),
	(6,3,2),
	(6,4,2),
	(7,1,2),
	(7,2,2),
	(7,3,2),
	(7,4,2),
	(8,1,2),
	(8,2,2),
	(8,3,2),
	(8,4,2),
	(9,1,2),
	(9,2,2),
	(9,3,2),
	(9,4,2),
	(10,1,2),
	(10,2,2),
	(10,3,2),
	(10,4,2),
	(11,1,2),
	(11,2,2),
	(11,3,2),
	(11,4,2),
	(12,1,2),
	(12,2,2),
	(12,3,2),
	(12,4,2),
	(13,1,2),
	(13,2,2),
	(13,3,2),
	(13,4,2),
	(14,1,2),
	(14,2,2),
	(14,3,2),
	(14,4,2),
	(15,1,2),
	(15,2,2),
	(15,3,2),
	(15,4,2),
	(16,1,2),
	(16,2,2),
	(16,3,2),
	(16,4,2),
	(17,1,2),
	(17,2,2),
	(17,3,2),
	(17,4,2),
	(18,1,2),
	(18,2,2),
	(18,3,2),
	(18,4,2),
	(19,1,2),
	(19,2,2),
	(19,3,2),
	(19,4,2),
	(20,1,2),
	(20,2,2),
	(20,3,2),
	(20,4,2)
;
SELECT * FROM book_copies;

--There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
--There are at least 50 loans in the BOOK_LOANS table.

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(6,1,100,'2019-05-03', '2019-06-03'),
	(7,1,100,'2019-05-03', '2019-06-03'),
	(8,1,100,'2019-05-03', '2019-06-03'),
	(7,1,101,'2019-02-12', '2019-03-12'),
	(8,1,101,'2019-02-12', '2019-03-12'),
	(9,1,101,'2019-02-12', '2019-03-12'),
	(12,1,102,'2019-03-14', '2019-04-14'),
	(13,1,102,'2019-03-14', '2019-04-14'),
	(14,2,103,'2019-06-26', '2019-07-26'),
	(15,2,103,'2019-06-26', '2019-07-26'),
	(16,2,103,'2019-06-26', '2019-07-26'),
	(14,1,104,'2019-08-19', '2019-09-19'),
	(15,1,104,'2019-08-19', '2019-09-19'),
	(16,1,104,'2019-08-19', '2019-09-19'),
	(17,1,104,'2019-08-19', '2019-09-19'),
	(18,1,105,'2019-09-19', '2019-10-19'),
	(11,1,105,'2019-09-19', '2019-10-19'),
	(1,1,105,'2019-09-19', '2019-10-19'),
	(2,1,105,'2019-09-19', '2019-10-19'),
	(3,1,105,'2019-09-19', '2019-10-19'),
	(4,1,105,'2019-09-19', '2019-10-19'),
	(5,1,105,'2019-09-19', '2019-10-19'),
	(20,4,105,'2019-09-21', '2019-09-21'),
	(19,4,105,'2019-09-21', '2019-09-21'),
	(18,4,105,'2019-09-21', '2019-09-21'),
	(17,4,105,'2019-09-21', '2019-09-21'),
	(16,4,105,'2019-09-21', '2019-09-21'),
	(15,4,105,'2019-09-21', '2019-09-21'),
	(17,3,106,'2019-09-22', '2019-09-22'),
	(16,3,106,'2019-09-22', '2019-09-22'),
	(15,3,106,'2019-09-22', '2019-09-22'),
	(14,3,106,'2019-09-23', '2019-09-23'),
	(13,3,106,'2019-09-23', '2019-09-23'),
	(1,2,107,'2019-09-23', '2019-09-23'),
	(2,2,107,'2019-09-23', '2019-09-23'),
	(3,2,107,'2019-09-23', '2019-09-23'),
	(4,2,107,'2019-09-24', '2019-09-24'),
	(5,2,107,'2019-09-24', '2019-09-24'),
	(6,2,107,'2019-09-24', '2019-09-24'),
	(7,2,107,'2019-09-24', '2019-09-24'),
	(8,2,107,'2019-09-24', '2019-09-24'),
	(9,2,103,'2019-09-24', '2019-09-24'),
	(10,2,103,'2019-09-24', '2019-09-24'),
	(3,4,101,'2019-09-25', '2019-09-25'),
	(4,4,101,'2019-09-25', '2019-09-25'),
	(5,4,101,'2019-09-25', '2019-09-25'),
	(6,4,101,'2019-09-25', '2019-09-25'),
	(2,3,100,'2019-09-27', '2019-09-27'),
	(3,3,100,'2019-09-27', '2019-09-27'),
	(4,3,100,'2019-09-27', '2019-09-27'),
	(5,3,100,'2019-09-28', '2019-09-28'),
	(1,3,100,'2019-09-28', '2019-09-28')	
;
SELECT * FROM book_loans;

--There are at least 8 borrowers in the BORROWER table, and at least 2 of those borrowers have more than 5 books loaned to them.
INSERT INTO borrower
	(Name, Address, Phone)
	VALUES
	('Jane Daniels', '7413 Union Dr., San Francisco, CA 94110', '(883) 758-2460'),
	('Andrew Trojanowski', '9344 South Drive, Pacoima, CA 91331', '(431) 250-5887'),
	('Silas Ziemba', '562 Smith Store Lane, Chula Vista, CA 91910', '(782) 449-0537'),
	('Rosalee Mustafa', '710B College Court, El Cajon, CA 92020', '(771) 691-0247'),
	('Gwenn Schwing', '9056 Smith Lane, San Jose, CA 95112', '(535) 533-6848'),
	('Elease Ahern', '743 Redwood Dr., Oakland, CA 94601', '(599) 485-7087'),
	('Winnifred Walberg', '7246 Lancaster Court, North Hills, CA 91343', '(824) 884-2118'),
	('Jefferson Harton', '9242 Gregory Ave., Porterville, CA 93257', '(265) 770-0447')
;
SELECT * FROM borrower;
