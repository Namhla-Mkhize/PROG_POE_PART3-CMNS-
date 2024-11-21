CREATE TABLE Claims_TBL (
    Claim_ID INT PRIMARY KEY IDENTITY(1,1),
    Lecturer_ID VARCHAR(50),
    Lecturer_Name VARCHAR(100),
    Hours_Worked DECIMAL(18, 2),
    Base_Rate DECIMAL(18, 2),
    Program_Code VARCHAR(50),
    Module_Name VARCHAR(100),
    Final_Payment DECIMAL(18, 2),
    FileName VARCHAR(255),
    FilePath VARCHAR(500)
);
