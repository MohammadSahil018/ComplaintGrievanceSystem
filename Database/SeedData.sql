/* =========================================
   Complaint Grievance System - Seed Data
   SQL Server 2008 Compatible
   ========================================= */

-- USE ComplainDB;
-- GO

/* =========================
   Seed Departments
   ========================= */
INSERT INTO Departments (DepartmentName, IsActive)
VALUES
('Electricity', 1),
('Road & Transport', 1),
('Water Supply', 1),
('Sanitation', 1),
('Agriculture', 1);
GO

/* =========================
   Seed Users (Admin + Dept + Test User)
   ========================= */

-- ADMIN user
INSERT INTO Users (FullName, Username, PasswordHash, Role, DepartmentId, IsActive, Email)
VALUES ('System Admin', 'admin', 'admin123', 'ADMIN', NULL, 1, 'admin@gmail.com');

-- Department Officers
INSERT INTO Users (FullName, Username, PasswordHash, Role, DepartmentId, IsActive, Email)
VALUES
('Electricity Officer', 'dept_elec', '123', 'DEPT', 1, 1, 'dept_elec@gmail.com'),
('Road Officer', 'dept_road', '123', 'DEPT', 2, 1, 'dept_road@gmail.com');

-- Citizen User
INSERT INTO Users (FullName, Username, PasswordHash, Role, DepartmentId, IsActive, Email)
VALUES ('Test Citizen', 'user1', '123', 'USER', NULL, 1, 'user1@gmail.com');

GO

/* =========================
   Seed 1 sample complaint
   ========================= */
INSERT INTO Complaints (UserId, DepartmentId, Subject, Description, CurrentStatus)
VALUES (3, 1, 'Power Issue', 'No electricity since morning', 'SUBMITTED');

DECLARE @CID INT;
SET @CID = SCOPE_IDENTITY();

INSERT INTO ComplaintStatusHistory (ComplaintId, Status, Remark, ChangedBy)
VALUES (@CID, 'SUBMITTED', 'Complaint submitted', 3);

GO
