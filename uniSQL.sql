CREATE TABLE Student (
student_ID    char(9)  PRIMARY KEY,
student_name  char(20) NOT NULL,
student_sname char(20) NOT NULL
);

CREATE TABLE Department (
depart_code char(4)  PRIMARY KEY,
depart_name char(40) NOT NULL UNIQUE
);

CREATE TABLE Instructor (
instructor_ID    char(9)  PRIMARY KEY,
instructor_name  char(20) NOT NULL,
instructor_sname char(20) NOT NULL,
depart_code      char(4)  NOT NULL REFERENCES Department(depart_code)
);

CREATE TABLE Course (
course_code        char(10)     PRIMARY KEY,
course_title       varchar(100) NOT NULL,
course_credits     tinyint      NOT NULL,
depart_code        char(4)      NOT NULL REFERENCES Department(depart_code),
course_description varchar(255) NOT NULL
);

CREATE TABLE Section (
section_ID       int      PRIMARY KEY,
section_term     char(8)  NOT NULL,
section_building char(6),
section_room     char(4),
section_time     char(10),
course_code      char(10) NOT NULL REFERENCES Course(course_code),
instructor_ID    char(9)  REFERENCES Instructor(instructor_ID)
);

CREATE TABLE Enrollment (
student_ID char(9) REFERENCES Student(student_ID),
section_ID int     REFERENCES Section(section_ID),
grade_code char(2),
PRIMARY KEY (student_ID, section_ID)
);

CREATE TABLE Prerequisite (
course_code     char(10) REFERENCES Course(course_code),
course_requires char(10) REFERENCES Course(course_code),
PRIMARY KEY (course_code, course_requires)
);

CREATE TABLE Qualified (
instructor_ID char(9) REFERENCES Instructor(instructor_ID),
course_code char(10) REFERENCES Course(course_code),
PRIMARY KEY (instructor_ID, course_code)
);

DESCRIBE Student; 