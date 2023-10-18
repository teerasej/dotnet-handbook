CREATE TABLE HealthCheckUpPackages (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    BestForAgeLength NVARCHAR(50) NOT NULL,
    BestForGender NVARCHAR(10) NOT NULL,
    ShortDescriptionThai NVARCHAR(MAX) COLLATE Latin1_General_100_CI_AI_SC_UTF8
);

INSERT INTO HealthCheckUpPackages (Name, Price, BestForAgeLength, BestForGender, ShortDescriptionThai)
VALUES
    ('Basic Package', 99.99, '18-65', 'Male', N'ชุดตรวจสุขภาพพื้นฐานสำหรับผู้ชาย'),
    ('Standard Package', 149.99, '18-65', 'Female', N'ชุดตรวจสุขภาพมาตรฐานสำหรับผู้หญิง'),
    ('Comprehensive Package', 199.99, '18-65', 'Any', N'ชุดตรวจสุขภาพครอบคลุมสำหรับทุกเพศ'),
    ('Senior Package', 129.99, '65+', 'Any', N'ชุดตรวจสุขภาพสำหรับผู้สูงอายุ'),
    ('Child Package', 79.99, '0-17', 'Any', N'ชุดตรวจสุขภาพสำหรับเด็ก'),
    ('Executive Package', 249.99, '18-65', 'Any', N'ชุดตรวจสุขภาพสำหรับผู้บริหาร');

-- Display the contents of the Health Check-Up Packages table
SELECT * FROM HealthCheckUpPackages;