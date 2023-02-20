CREATE DATABASE Diplom_projectMI


USE [Diplom_projectMI]


CREATE TABLE Dim_Student
(
[Id_Student]   INT IDENTITY (1, 1) PRIMARY KEY NOT NULL, 
[Name]         VARCHAR(45) NOT NULL,
[Lastname]     VARCHAR(45) NOT NULL,
[Dob]          DATE NOT NULL,
[Pasport_Id]   VARCHAR(45) NOT NULL,
[Phone_number] VARCHAR(45) NOT NULL,
[Email]        VARCHAR(45) NOT NULL, 
[Start_date]   Date NOT NULL,
[End_date]     Date NOT NULL
);

CREATE TABLE Dim_Teacher
(
[Id_teacher]   INT IDENTITY (1, 1) PRIMARY KEY NOT NULL, 
[Name]         VARCHAR(45) NOT NULL,
[Lastname]     VARCHAR(45) NOT NULL,
[Dob]          DATE NOT NULL,
[Major]        NVARCHAR(225) NOT NULL
);

CREATE TABLE Fct_attendance_and_marks
(
[Id_attendance_and_marks] INT IDENTITY (1, 1) PRIMARY KEY  NOT NULL,
[Student_id]              INT NOT NULL, 
[Attendance]              BIT, 
[Date]                    DATE NOT NULL, 
[Lesson_id]               SMALLINT DEFAULT 1 NOT NULL,
[Mark]                    SMALLINT,
FOREIGN KEY (Student_id) REFERENCES Dim_Student (Id_Student)
);

CREATE TABLE Dim_Lessons
(
[Id_Lessons]   INT IDENTITY (1, 1) PRIMARY KEY NOT NULL, 
[Name]         VARCHAR(45) NOT NULL,
[Discription]  NVARCHAR(225),
[Course_name]  NVARCHAR(95) NOT NULL
FOREIGN KEY (Id_Lessons) REFERENCES Fct_attendance_and_marks (Id_attendance_and_marks)
);

CREATE TABLE Fct_timetable
(
[Id_timetable]  INT IDENTITY (1, 1) PRIMARY KEY NOT NULL, 
[Student_id]    INT NOT NULL, 
[Date_time]     DATETIME NOT NULL, 
[Lesson_id]     INT NOT NULL,
[Room]          VARCHAR(45) NOT NULL,
[Teacher_id]    INT NOT NULL,
FOREIGN KEY (Student_id) REFERENCES Dim_Student(Id_Student),
FOREIGN KEY (Lesson_id) REFERENCES Dim_Lessons (Id_Lessons),
FOREIGN KEY (Teacher_id) REFERENCES Dim_Teacher (Id_teacher)
);
 

