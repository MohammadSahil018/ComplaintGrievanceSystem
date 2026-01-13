/* =========================================
   Complaint Grievance System - Create Tables
   SQL Server 2008 Compatible
   ========================================= */

-- Use your database
-- USE ComplainDB;
-- GO

/* Drop tables if exist (optional during dev)
   Run only if you want clean reset */

IF OBJECT_ID('dbo.PasswordResetOTP', 'U') IS NOT NULL DROP TABLE dbo.PasswordResetOTP;
IF OBJECT_ID('dbo.ComplaintStatusHistory', 'U') IS NOT NULL DROP TABLE dbo.ComplaintStatusHistory;
IF OBJECT_ID('dbo.Complaints', 'U') IS NOT NULL DROP TABLE dbo.Complaints;
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
IF OBJECT_ID('dbo.Departments', 'U') IS NOT NULL DROP TABLE dbo.Departments;
GO

/* =========================
   1) Departments
   ========================= */
CREATE TABLE Departments (
    DepartmentId INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    IsActive BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

/* =========================
   2) Users
   ========================= */
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Username VARCHAR(50) NOT NULL,
    PasswordHash VARCHAR(256) NOT NULL,   -- plain now / later hashing
    Role VARCHAR(20) NOT NULL,            -- ADMIN / DEPT / USER
    DepartmentId INT NULL,                -- only for DEPT user
    IsActive BIT DEFAULT 1,
    CreatedDate DATETIME DEFAULT GETDATE(),
    Email VARCHAR(100) NULL
);
GO

-- Unique username
ALTER TABLE Users
ADD CONSTRAINT UQ_Users_Username UNIQUE (Username);
GO

-- Unique email
ALTER TABLE Users
ADD CONSTRAINT UQ_Users_Email UNIQUE (Email);
GO

-- FK Users -> Departments
ALTER TABLE Users
ADD CONSTRAINT FK_Users_Departments
FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId);
GO

/* =========================
   3) Complaints
   ========================= */
CREATE TABLE Complaints (
    ComplaintId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    DepartmentId INT NOT NULL,
    Subject VARCHAR(1000) NOT NULL,
    Description VARCHAR(2000) NOT NULL,
    CurrentStatus VARCHAR(30) NOT NULL,   -- SUBMITTED / IN_PROGRESS / RESOLVED etc.
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

-- FK Complaints -> Users
ALTER TABLE Complaints
ADD CONSTRAINT FK_Complaints_Users
FOREIGN KEY (UserId) REFERENCES Users(UserId);
GO

-- FK Complaints -> Departments
ALTER TABLE Complaints
ADD CONSTRAINT FK_Complaints_Departments
FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId);
GO

/* =========================
   4) Complaint Status History
   ========================= */
CREATE TABLE ComplaintStatusHistory (
    HistoryId INT IDENTITY(1,1) PRIMARY KEY,
    ComplaintId INT NOT NULL,
    Status VARCHAR(30) NOT NULL,
    Remark VARCHAR(500) NULL,
    ChangedBy INT NOT NULL,
    ChangedDate DATETIME DEFAULT GETDATE()
);
GO

-- FK History -> Complaints
ALTER TABLE ComplaintStatusHistory
ADD CONSTRAINT FK_History_Complaints
FOREIGN KEY (ComplaintId) REFERENCES Complaints(ComplaintId);
GO

-- FK History -> Users
ALTER TABLE ComplaintStatusHistory
ADD CONSTRAINT FK_History_Users
FOREIGN KEY (ChangedBy) REFERENCES Users(UserId);
GO

/* =========================
   5) PasswordResetOTP (optional)
   ========================= */
CREATE TABLE PasswordResetOTP (
    OTPId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    OTPCode VARCHAR(10) NOT NULL,
    ExpiryTime DATETIME NOT NULL,
    IsUsed BIT DEFAULT 0,
    CreatedDate DATETIME DEFAULT GETDATE()
);
GO

ALTER TABLE PasswordResetOTP
ADD CONSTRAINT FK_OTP_Users
FOREIGN KEY (UserId) REFERENCES Users(UserId);
GO
