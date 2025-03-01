create database sales;
use sales;
CREATE TABLE Country (
  Id INT PRIMARY KEY,
  Country_name VARCHAR(50),
  Population DECIMAL,
  Area DECIMAL
);
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'USA', 331002651, 9833520),
(2, 'Canada', 37742154, 9984670),
(3, 'UK', 67886011, 243610),
(4, 'India', 1380004385, 3287590),
(5, 'China', 1443496281, 9596961),
(6, 'Indonesia', 273523615, 1905090),
(7, 'Mexico', 127575529, 1964375),
(8, 'Turkey', 84339067, 783562),
(9, 'Germany', 83149300, 357021),
(10, 'Australia', 25887600, 7692024);
drop table country;
CREATE TABLE Persons (
  Id INT PRIMARY KEY,
  Fname VARCHAR(50),
  Lname VARCHAR(50),
  Population DECIMAL,
  Rating DECIMAL,
  Country_Id INT,
  Country_name VARCHAR(50),
  FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name)
VALUES
(1, 'John', 'Doe', 331002651, 4.5, 1, 'USA'),
(2, 'Jane', 'Smith', 37742154, 4.2, 2, 'Canada'),
(3, 'Robert', 'Johnson', 67886011, 4.8, 3, 'UK'),
(4, 'Maria', 'Rodriguez', 1380004385, 4.6, 4, 'India'),
(5, 'Li', 'Wong', 1443496281, 4.9, 5, 'China'),
(6, 'Ayu', 'Sulistiyani', 273523615, 4.4, 6, 'Indonesia'),
(7, 'Carlos', 'Garcia', 127575529, 4.3, 7, 'Mexico'),
(8, 'Ahmed', 'Mohamed', 84339067, 4.7, 8, 'Turkey'),
(9, 'Hans', 'Müller', 83149300, 4.1, 9, 'Germany'),
(10, 'Emily', 'Chen', 25887600, 4.5, 10, 'Australia');

ALTER TABLE Persons
ADD DOB DATE;
UPDATE persons
SET DOB = CASE Id
        When 1 Then '1990-01-01'
         When 2 Then  '1992-02-02'
         When 3 Then '1991-03-03'
        When 4 Then '1995-04-04'
        When 5 Then  '1993-05-05'
		When 6 Then  '1996-06-06'
        When 7 Then  '1994-07-07'
        When 8 Then  '1997-08-08'
        When 9 Then  '1998-09-09'
        When 10 Then '1999-10-10'
        END;
    select*from Persons;
    SET SQL_SAFE_UPDATES = 0;
    DELIMITER //
CREATE FUNCTION sales.calculate_age(dob DATE)
RETURNS INT
deterministic
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dob, CURDATE());
    RETURN age;
END //
DELIMITER ;
select sales.calculate_age('1999-10-10');
SELECT Id, Fname, Lname, calculate_age(DOB) AS Age
FROM Persons;
SELECT Country_name, LENGTH(Country_name) AS Length
FROM Country;
SELECT Country_name, SUBSTRING(Country_name, 1, 3) AS First_Three_Characters
FROM Country;
SELECT Country_name, UPPER(Country_name) AS Uppercase, LOWER(Country_name) AS Lowercase
FROM Country;