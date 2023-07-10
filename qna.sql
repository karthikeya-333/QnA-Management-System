CREATE DATABASE HOMEWORK_APPLICATION;

USE HOMEWORK_APPLICATION;

CREATE TABLE Student(
student_id INT PRIMARY KEY  NOT NULL,
student_name VARCHAR(20) NOT NULL,
student_email VARCHAR(100) NOT NULL,
student_password VARCHAR(100) NOT NULL
);

CREATE TABLE Expert(
expert_id INT PRIMARY KEY  NOT NULL,
expert_name VARCHAR(20) NOT NULL,
expert_email VARCHAR(100) NOT NULL,
expert_password VARCHAR(100) NOT NULL,
expert_subject VARCHAR(20) NOT NULL
);

CREATE TABLE Statistics(
expert_id INT PRIMARY KEY NOT NULL,
question_sloved INT DEFAULT 0,
upvotes INT DEFAULT 0,
downvotes INT DEFAULT 0,
quality_score INT ,
satisfaction_rate INT,
FOREIGN KEY(expert_id) REFERENCES Expert(expert_id)
);

CREATE TABLE Question(
question_id INT PRIMARY KEY NOT NULL,
student_id INT,
question_text VARCHAR(500) NOT NULL,
post_date DATE,
 FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE Answer(
  answer_id INT PRIMARY KEY,
  expert_id INT,
  question_id INT,
  answer_text VARCHAR(1000) NOT NULL,
  post_date DATE,
  FOREIGN KEY (expert_id) REFERENCES Expert(expert_id),
  FOREIGN KEY (question_id) REFERENCES Question(question_id)
);

CREATE TABLE Vote(
  vote_id INT PRIMARY KEY,
  student_id INT,
  answer_id INT,
  vote_value INT,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (answer_id) REFERENCES Answer(answer_id)
);

