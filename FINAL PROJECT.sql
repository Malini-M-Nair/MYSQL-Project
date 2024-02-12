CREATE DATABASE Library;

USE Library;

# Create the branch table.
CREATE Table Branch (
	Branch_no INT PRIMARY KEY,
    Manager_id INT,
    Branch_address VARCHAR (200),
    Contact_no VARCHAR(10)
    );
    
# Create the employee table.
CREATE Table Employee (
	Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR (50),
    Salary DECIMAL (10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
    );
    
# Create the customer table
CREATE Table Customer (
	Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(200),
    Customer_address VARCHAR(250),
    Reg_date date
    );
    
#Create the book table
CREATE Table Books (
	ISBN VARCHAR (25) PRIMARY KEY,
	Book_title VARCHAR (200),
	Category VARCHAR(50),
	Rental_Price DECIMAL (10, 2),
	Status VARCHAR (5),
	Author VARCHAR (150),
	Publisher VARCHAR(200)
);

# Create the IssueStatus table.
CREATE Table IssueStatus ( 
	Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issue_book_name VARCHAR(200),
    Issue_date DATE,
    ISBN_Book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer (Customer_Id),
    FOREIGN KEY (ISBN_Book) REFERENCES Books(ISBN)
    );
    
# Create the Returnstatus table.
CREATE Table ReturnStatus (
	Return_Id INT PRIMARY KEY,
    Return_Cust INT,
    Return_book_name VARCHAR (200),
    Return_date DATE,
    ISBN_Book2 VARCHAR(25),
    FOREIGN KEY (Return_cust) REFERENCES Customer (customer_Id),
    FOREIGN KEY (ISBN_Book2) REFERENCES Books(ISBN)
    );	
    
# Insert values into the Branch table.
INSERT INTO Branch (Branch_no,Manager_Id, Branch_address, Contact_no) VALUES
(1,101,'123 Main St','555-1234'),
(2,102,'456 Oak St', '555-5678'),
(3,103,'789 Pine St','555-9876'),
(4,104,'101 Elm St','555-4321'),
(5,105,'202 Maple St','555-8765'),
(6,106,'303 Birch St','555-2345'),
(7,107,'404 Cedar St','555-3456'),
(8,108,'505 Walnut','555-6789'),
(9,109,'606 Willow St','555-7890'),
(10,110,'707 Oak St','555-6543');

#Insert values into the Employee table.
INSERT INTO Employee (Emp_Id,Emp_name,position,salary,Branch_no)VALUES
(201,'John Doe','Manager',60000.00,1),
(202,'Jame Smith','Clerk',40000.00,1),
(203,'Bob Johnson','Manager',65000.00,2),
(204,'Mary White','Clerk',42000.00,2),
(205,'Alice Black','Clerk',42000.00,3),
(206,'Charlie Brown','Manager',70000.00,3),
(207,'David Davis','Clerk',45000.00,4),
(208,'Eva Green','Manager',75000.00,4),
(209,'Frank Jones','Clerk',48000.00,5),
(210,'Grace lee','Manager',80000.00,5);

#Insert values into the customer table. 
INSERT INTO Customer (Customer_id,Customer_name,Customer_address,Reg_date) VALUES
(301,'Alice Johnson','789 Pine St','2023-01-15'),
(302,'Bob Williams','101 Elm St','2023-02-20'),
(303,'Charlie Davis','202 Maple St','2023-03-10'),
(304,'David Smith','303 Birch St','2023-04-05'),
(305,'Eva Brown',  '404 cedar St','2023-05-15'),
(306,'Frank White','505 Walnut St','2023-06-20'),
(307,'Grace Lee','606 Willow St','2023-08-05'),
(308,'Helen Jones','707 Oak st','2023-09-15'),
(309,'Ivan Green','808 Pine st','2023-09-15'),
(310,'Jack Black','909 Elm St','2023-10-20');

# Insert values inti the Books table
INSERT INTO Books (ISBN,Book_Title,Category,Rental_Price,Status,Author,Publisher) VALUES
('ISBN001','Book1','Fiction',5.99,'Yes','Author 1','Publisher 1'),
('ISBN002','Book2','Non-Fiction',7.99,'Yes','Author 2','Publisher 2'),
('ISBN003','Book3','Mystery',6.99,'Yes','Author 3','Publisher 3'),
('ISBN004','Book4','Science Fiction',8.99,'Yes','Author 4','Publisher 4'),
('ISBN005','Book5','Biography',9.99,'Yes','Author 5','Publisher 5'),
('ISBN006','Book6','History',4.99,'Yes','Author 6','Publisher 6'),
('ISBN007','Book7','Romance',3.99,'Yes','Author 7','Publisher 7'),
('ISBN008','Book8','Thriller',5.99,'Yes','Author 8','Publisher 8'),
('ISBN009','Book9','Fastasy',6.99,'Yes','Author 9','Publisher 9'),
('ISBN010','Book10','Self-Help',7.99,'Yes','Author 10','Publisher 10');

# Insert values into the IssueStatus table.
INSERT INTO IssueStatus (Issue_Id,Issued_cust,Issue_book_name,Issue_date,Isbn_book)VALUES
(401,301,'Book1','2023-03-01','ISBN001'),
(402,302,'Book2','2023-03-05','ISBN002'),
(403,303,'Book3','2023-03-10','ISBN003'),
(404,304,'Book4','2023-03-15','ISBN004'),
(405,305,'Book5','2023-03-20','ISBN005'),
(406,306,'Book6','2023-03-25','ISBN006'),
(407,307,'Book7','2023-03-30','ISBN007'),
(408,308,'Book8','2023-04-05','ISBN008'),
(409,309,'Book9','2023-04-10','ISBN009'),
(410,310,'Book10','2023-04-15','ISBN010');

# Insert values into the ReturnStatus table.
INSERT INTO ReturnStatus (Return_Id,Return_cust,Return_book_name,Return_date,ISBN_book2)VALUES
(501,301,'Book1','2023-03-10','ISBN001'),
(502,302,'Book2','2023-03-15','ISBN002'),
(503,303,'Book3','2023-03-20','ISBN003'),
(504,304,'Book4','2023-03-25','ISBN004'),
(505,305,'Book5','2023-03-30','ISBN005'),
(506,306,'Book6','2023-04-05','ISBN006'),
(507,307,'Book7','2023-04-10','ISBN007'),
(508,308,'Book8','2023-04-15','ISBN008'),
(509,309,'Book9','2023-04-20','ISBN009'),
(510,310,'Book10','2023-04-25','ISBN010');

# 1. Retrieve the book title, category, and rental price of all available books.
SELECT Book_title,category, rental_price FROM Books;

# 2. List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
SELECT I.Issue_book_name,c.customer_name FROM IssueStatus
 I INNER JOIN Customer c ON I.Issued_cust = c.customer_Id;
 
 # 4. Display the total count of books in each category. 
 SELECT Category AS Book_Category, count(*) FROM Books GROUP BY Book_Category;
 
 # 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
 SELECT Emp_name,  Position FROM Employee WHERE Salary > 50000;
 
 # 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
 SELECT Customer_name, Reg_date FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id 
 NOT IN (SELECT Issued_cust FROM IssueStatus);
 
 # 7. Display the branch numbers and the total count of employees in each branch. 
 SELECT Branch_no, count(Emp_name) AS Total_Employees FROM Employee GROUP BY Branch_no;
 
 # 8. Display the names oof customers who have issued books in the month of june 2023. 
 SELECT Customer_name FROM Customer WHERE Customer_Id IN (SELECT Issued_cust 
 FROM IssueStatus WHERE MONTH(Issue_date) = 6 AND year (Issue_date) = 2023);
 
 # 9. Retrieve book_title from book table containing history. 
 SELECT Book_title FROM Books WHERE Category = "History";
 
 # 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
 SELECT Branch_no,count (Emp_name) AS Total_employee FROM Employee GROUP BY Branch_no HAVING Total_Employee > 5;
 
    