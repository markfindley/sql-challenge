--DROP TABLE Employees
--DROP TABLE Salaries 
--DROP TABLE Titles 
--DROP TABLE Departments 
--DROP TABLE DeptEmp 
--DROP TABLE DeptManager

CREATE TABLE Employees (
    EmpNo int   NOT NULL,
    BirthDate date   NOT NULL,
    FirstName varchar(100)   NOT NULL,
    LastName varchar(100)   NOT NULL,
    Gender char(1)   NOT NULL,
    HireDate date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        EmpNo
     )
);

CREATE TABLE Salaries (
    EmpNo int   NOT NULL,
    Salary money   NOT NULL,
    FromDate date   NOT NULL,
    ToDate date   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        EmpNo, FromDate
     )
);

CREATE TABLE Titles (
    EmpNo int   NOT NULL,
    Title varchar(100)   NOT NULL,
    FromDate date   NOT NULL,
    ToDate date   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        EmpNo, FromDate
     )
);

CREATE TABLE Departments (
    DeptNo char(4) NOT NULL,
    DeptName varchar(100)   NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        DeptNo
     )
);

CREATE TABLE DeptEmp (
    EmpNo int   NOT NULL,
    DeptNo char(4)  NOT NULL,
    FromDate date   NOT NULL,
    ToDate date   NOT NULL,
    CONSTRAINT pk_DeptEmp PRIMARY KEY (
        EmpNo, DeptNo, FromDate
     )
);

CREATE TABLE DeptManager (
    DeptNo char(4)  NOT NULL,
    EmpNo int   NOT NULL,
    FromDate date   NOT NULL,
    ToDate date   NOT NULL,
    CONSTRAINT pk_DeptManager PRIMARY KEY (
        DeptNo, EmpNo, FromDate
     )
);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE Titles ADD CONSTRAINT fk_Titles_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DeptEmp ADD CONSTRAINT fk_DeptEmp_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

ALTER TABLE DeptEmp ADD CONSTRAINT fk_DeptEmp_DeptNo FOREIGN KEY(DeptNo)
REFERENCES Departments (DeptNo);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_DeptNo FOREIGN KEY(DeptNo)
REFERENCES Departments (DeptNo);

ALTER TABLE DeptManager ADD CONSTRAINT fk_DeptManager_EmpNo FOREIGN KEY(EmpNo)
REFERENCES Employees (EmpNo);

-- now import the tables
select count(*) from Employees
select count(*) from Salaries 
select count(*) from Titles 
select count(*) from Departments 
select count(*) from DeptEmp 
select count(*) from DeptManager 