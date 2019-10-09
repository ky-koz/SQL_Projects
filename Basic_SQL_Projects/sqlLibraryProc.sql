USE db_library
Go


-- 1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?
CREATE PROC getTitleByBranch
AS
SELECT a2.Title, a1.Number_Of_copies, a3.BranchName
	FROM book_copies a1
	INNER JOIN books a2 ON a2.BookID = a1.BookID
	INNER JOIN library_branch a3 ON a3.BranchID = a1.BranchID
	WHERE Title = 'The Lost Tribe'
	AND BranchName = 'Sharpstown'
;

-- 2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?
CREATE PROC getCopiesByTitle
AS
SELECT a2.Title, a1.Number_Of_copies, a3.BranchName
	FROM book_copies a1
	INNER JOIN books a2 ON a2.BookID = a1.BookID
	INNER JOIN library_branch a3 ON a3.BranchID = a1.BranchID
	WHERE Title = 'The Lost Tribe'
;

-- 3.) Retrieve the names of all borrowers who do not have any books checked out.
CREATE PROC getBorrowersByCount
AS
SELECT 
	a1.Name,
	COUNT(BookID) AS 'Books Checked Out'
FROM borrower a1
	FULL OUTER JOIN book_loans a2 ON a2.CardNo = a1.CardNo
GROUP BY
	Name
HAVING
	COUNT(BookID) < 1
;

-- 4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today, retrieve the book title, the borrower's name, and the borrower's address.
CREATE PROC getBooksDueToday
AS
SELECT
	a3.Title, a4.BranchName, a2.Name, a2.Address, a1.DateDue
FROM book_loans a1
	Inner JOIN borrower a2 ON a2.CardNo = a1.CardNo
	INNER JOIN books a3 ON a3.BookID = a1.BookID
	INNER JOIN library_branch a4 ON a4.BranchID = a1.BranchID
WHERE
	BranchName = 'Sharpstown'
	AND DateDue = CONVERT(DATE, GETDATE())
;

-- 5.) For each library branch, retrieve the branch name and the total number of books loaned out from that branch.
CREATE PROC getLoansByBranch
AS
SELECT 
	a2.BranchName, COUNT(a1.BookID)
FROM book_loans a1
	INNER JOIN library_branch a2 ON a2.BranchID = a1.BranchID
GROUP BY
	BranchName
;

-- 6.) Retrieve the names, addresses, and the number of books checked out for all borrowers who have more than five books checked out.
CREATE PROC getBorrowersByCountWithAddress
AS
SELECT 
	a1.Name,
	a1.Address,
	COUNT(BookID) AS 'Books Checked Out'
FROM borrower a1
	FULL OUTER JOIN book_loans a2 ON a2.CardNo = a1.CardNo
GROUP BY
	Name, Address
HAVING
	COUNT(BookID) >= 5
;

-- 7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of copies owned by the library branch whose name is "Central".
CREATE PROC getCopiesByBranchAndAuthor
AS
SELECT
	a2.BranchName,
	a3.Title, 
	a4.AuthorName, 
	a1.Number_Of_Copies
FROM book_copies a1
	INNER JOIN library_branch a2 ON a2.BranchID = a1.BranchID
	INNER JOIN books a3 ON a3.BookID = a1.BookID
	INNER JOIN book_authors a4 ON a4.BookID = a1.BookID
WHERE
	AuthorName = 'Stephen King'
	AND BranchName = 'Central'
;

