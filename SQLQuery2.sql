USE HRM;
GO


CREATE TABLE Departments( -- Phòng ban
    Id CHAR(3) NOT NULL, -- Mã phòng
    Name NVARCHAR(50) NOT NULL, -- Tên phòng
    Description NVARCHAR(255) NULL, -- Mô tả phòng
    PRIMARY KEY(Id)
);
GO

CREATE TABLE Employees( -- Nhân viên
    Id VARCHAR(20) NOT NULL, -- Mã nhân viên
    Password NVARCHAR(50) NOT NULL, -- Mật khẩu
    Fullname NVARCHAR(50) NOT NULL, -- Họ và tên
    Photo NVARCHAR(50) NOT NULL, -- Hình ảnh
    Gender BIT NOT NULL, -- Giới tính
    Birthday DATE NOT NULL, -- Ngày sinh
    Salary FLOAT NOT NULL, -- Lương cơ bản
    DepartmentId CHAR(3) NOT NULL, -- Mã phòng
    PRIMARY KEY (Id),
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
        ON DELETE CASCADE -- Xóa dây chuyền theo DepartmentId
        ON UPDATE CASCADE  -- Sửa dây chuyền theo DepartmentId
);
GO


SELECT * FROM Departments;

SELECT * FROM Departments
WHERE Id = 'D01';

INSERT INTO Departments (Id, Name, Description)
VALUES ('D01', N'Phòng Kế Toán', N'Phụ trách công việc kế toán');

UPDATE Departments
SET Name = N'Phòng Kế Toán - Tài Chính',
    Description = N'Phụ trách kế toán và tài chính công ty'
WHERE Id = 'D01';

DELETE FROM Departments
WHERE Id = 'D01';


SELECT * FROM Employees;

SELECT * FROM Employees
WHERE Id = 'E001';



INSERT INTO Employees 
(Id, [Password], Fullname, Photo, Gender, Birthday, Salary, DepartmentId)
VALUES 
('E001', '123456', N'Nguyễn Văn A', N'photo1.jpg', 1, '1995-05-10', 12000000, 'D01');


UPDATE Employees
SET Fullname = N'Nguyễn Văn A (Cập nhật)',
    Salary = 13000000,
    DepartmentId = 'D02'
WHERE Id = 'E001';


DELETE FROM Employees
WHERE Id = 'E001';


