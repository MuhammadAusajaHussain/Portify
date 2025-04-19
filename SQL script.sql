
-- 1. Users Table (Admin login)
CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(50) DEFAULT 'admin'
);
GO

-- 2. Projects Table (Portfolio / Case Studies)
CREATE TABLE Projects (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    ClientName NVARCHAR(255),
    Outcome TEXT,
    ImageUrl NVARCHAR(500),
    TestimonialId INT,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO
select * from Projects;

-- 3. Services Table
CREATE TABLE Services (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Description TEXT NOT NULL,
    Price DECIMAL(10,2) NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- 4. Testimonials Table
CREATE TABLE Testimonials (
    Id INT PRIMARY KEY IDENTITY(1,1),
    ClientName NVARCHAR(255) NOT NULL,
    Company NVARCHAR(255),
    Quote TEXT NOT NULL,
    LogoUrl NVARCHAR(500),
    CreatedAt DATETIME DEFAULT GETDATE()
);
GO

-- Foreign key from Projects to Testimonials with cascade
ALTER TABLE Projects
ADD CONSTRAINT FK_Projects_Testimonials
FOREIGN KEY (TestimonialId) REFERENCES Testimonials(Id)
ON UPDATE CASCADE
ON DELETE CASCADE;
GO

-- 5. Contact Submissions Table
CREATE TABLE ContactSubmissions (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Message TEXT NOT NULL,
    SubmittedAt DATETIME DEFAULT GETDATE()
);
GO

-- 6. Certifications / Achievements Table
CREATE TABLE Certifications (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(255) NOT NULL,
    Institution NVARCHAR(255),
    IssuedDate DATE
);
GO

-- 7. Booking Appointments Table
CREATE TABLE Appointments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    ServiceId INT,
    DateTime DATETIME NOT NULL,
    Message TEXT,
    Status NVARCHAR(50) DEFAULT 'pending'
);
GO

-- Foreign key from Appointments to Services with cascade
ALTER TABLE Appointments
ADD CONSTRAINT FK_Appointments_Services
FOREIGN KEY (ServiceId) REFERENCES Services(Id)
ON UPDATE CASCADE
ON DELETE CASCADE;
GO

SELECT * FROM Appointments;


-- Users Table
INSERT INTO Users (Name, Email, PasswordHash, Role)
VALUES 
('Muhammad Abdullah', 'admin@example.com', 'hashed_password_123', 'admin');

-- Testimonials Table
INSERT INTO Testimonials (ClientName, Company, Quote, LogoUrl)
VALUES 
('Sarah Khan', 'InnovateX', 'Working with you was a game-changer for our business.', 'https://example.com/logo1.png'),
('Ali Raza', 'DesignPro', 'Absolutely professional and creative throughout!', 'https://example.com/logo2.png');
UPDATE Testimonials
SET LogoUrl = 'https://img.freepik.com/free-vector/colorful-bird-illustration-gradient_343694-1741.jpg?t=st=1744881842~exp=1744885442~hmac=ece2879459c63fb204fc37675bb52bf983adeeeaec02d9105ab93c45a8a97379&w=900'
WHERE ClientName IN ('Sarah Khan', 'Ali Raza');
select * from Testimonials;

-- Projects Table
INSERT INTO Projects (Title, Description, ClientName, Outcome, ImageUrl, TestimonialId)
VALUES 
('E-commerce Platform', 'Developed a scalable e-commerce solution.', 'InnovateX', 'Boosted sales by 45%', 'https://static-00.iconduck.com/assets.00/code-square-icon-2048x2046-m586k9yr.png', 1),
('Portfolio Website', 'Built a responsive and dynamic personal portfolio.', 'DesignPro', 'Increased visibility and job offers', 'https://static-00.iconduck.com/assets.00/code-square-icon-2048x2046-m586k9yr.png', 2);


INSERT INTO Projects (Title, Description, ClientName, Outcome, ImageUrl, TestimonialId)
VALUES 
('AI-Powered Resume Screener', 
 'Created a resume screening tool that uses AI to match candidates with job requirements.', 
 'TalentBridge', 
 'Reduced hiring time by 30%', 
 'https://static-00.iconduck.com/assets.00/code-square-icon-2048x2046-m586k9yr.png', 
 2);


 select * from Appointments;


-- Services Table
INSERT INTO Services (Title, Description, Price)
VALUES 
('Web Development', 'Modern, responsive websites using latest technologies.', 500.00),
('UI/UX Design', 'Intuitive and beautiful user experiences.', 300.00),
('SEO Optimization', 'Improve your visibility on search engines.', 200.00);

-- ContactSubmissions Table
INSERT INTO ContactSubmissions (Name, Email, Message)
VALUES 
('John Doe', 'john@example.com', 'Interested in a website revamp.'),
('Jane Smith', 'jane@example.com', 'Looking for a UX designer for my app.');

-- Certifications Table
INSERT INTO Certifications (Title, Institution, IssuedDate)
VALUES 
('Full Stack Web Development', 'Coursera', '2023-08-15'),
('Google UX Design', 'Google', '2022-11-01');

-- Appointments Table
INSERT INTO Appointments (Name, Email, ServiceId, DateTime, Message)
VALUES 
('Alice Walker', 'alice@example.com', 8, '2025-04-20 14:00', 'Discuss project scope.'),
('Bob Martin', 'bob@example.com', 9, '2025-04-22 10:30', 'Need UI feedback.');

select * from Services;