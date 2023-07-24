CREATE DATABASE HOMEWORK_APPLICATION;

USE HOMEWORK_APPLICATION;

CREATE TABLE Student(
student_id INT PRIMARY KEY  ,
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
expert_id INT NOT NULL,
question_solved INT DEFAULT 0,
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
question_subject VARCHAR(20) NOT NULL,
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

CREATE TABLE Comments (
  comment_id INT PRIMARY KEY,
  student_id INT,
  answer_id INT,
  comment_text VARCHAR(500) NOT NULL,
  post_date DATE,
  FOREIGN KEY (student_id) REFERENCES Student(student_id),
  FOREIGN KEY (answer_id) REFERENCES Answer(answer_id)
);

INSERT INTO Comment (comment_id, student_id, answer_id, comment_text, post_date)
VALUES
  (1, 1, 1, NULL, 'comment1', '2023-07-02'),
  (2, 2, 1, NULL, 'comment2', '2023-07-03'),
  (3, 3, 2, NULL, 'comment1', '2023-07-04'),
  (4, 4, 3, NULL, 'comment2', '2023-07-05'),
  (5, 5, 3, NULL, 'comment1', '2023-07-06'),
  (6, 1, 4, NULL, 'comment2', '2023-07-07'),
  (7, 2, NULL, 1, 'comment1', '2023-07-08'),
  (8, 3, NULL, 2, 'comment2', '2023-07-09'),
  (9, 4, NULL, 5, 'comment1', '2023-07-10'),
  (10, 5, NULL, 7, 'comment2', '2023-07-11');


INSERT INTO Student (student_id, student_name, student_email, student_password)
VALUES
  (1, 'Aditi Sharma', 'aditi@example.com', 'pass123'),
  (2, 'Aryan Patel', 'aryan@example.com', 'pass456'),
  (3, 'Divya Singh', 'divya@example.com', 'securepass'),
  (4, 'Kiran Kumar', 'kiran@example.com', 'password123'),
  (5, 'Neha Gupta', 'neha@example.com', 'pass789'),
  (6, 'Rajesh Shah', 'rajesh@example.com', 'pass987'),
  (7, 'Sanjay Verma', 'sanjay@example.com', 'pass654'),
  (8, 'Shreya Das', 'shreya@example.com', 'pass321'),
  (9, 'Rohit Desai', 'rohit@example.com', 'passxyz'),
  (10, 'Meera Joshi', 'meera@example.com', 'passwordabc'),
  (11, 'Prakash Mishra', 'prakash@example.com', 'passmno'),
  (12, 'Ananya Reddy', 'ananya@example.com', 'passqwe'),
  (13, 'Vivek Sharma', 'vivek@example.com', 'passasd'),
  (14, 'Sneha Mehta', 'sneha@example.com', 'passzxc'),
  (15, 'Arjun Malhotra', 'arjun@example.com', 'passpoi'),
  (16, 'Ishaan Kapoor', 'ishaan@example.com', 'passlkj'),
  (17, 'Tanvi Agarwal', 'tanvi@example.com', 'passqaz'),
  (18, 'Riya Nair', 'riya@example.com', 'passwsx'),
  (19, 'Karthik Iyer', 'karthik@example.com', 'passedc'),
  (20, 'Swati Bhatia', 'swati@example.com', 'passrfv');
  
INSERT INTO Expert (expert_id, expert_name, expert_email, expert_password, expert_subject)
VALUES
  (1, 'Dr. Rajesh Kumar', 'rajesh@example.com', 'pass123', 'Mathematics'),
  (2, 'Prof. Nisha Sharma', 'nisha@example.com', 'pass456', 'Mathematics'),
  (3, 'Dr. Priya Singh', 'priya@example.com', 'securepass', 'Mathematics'),
  (4, 'Prof. Mohan Verma', 'mohan@example.com', 'password123', 'Mathematics'),
  (5, 'Dr. Anita Patel', 'anita@example.com', 'pass789', 'Mathematics'),
  (6, 'Prof. Rahul Sharma', 'rahul@example.com', 'pass987', 'Chemistry'),
  (7, 'Dr. Meera Gupta', 'meera@example.com', 'pass654', 'Chemistry'),
  (8, 'Prof. Ankit Singh', 'ankit@example.com', 'pass321', 'Chemistry'),
  (9, 'Dr. Ravi Desai', 'ravi@example.com', 'passxyz', 'Physics'),
  (10, 'Prof. Neha Joshi', 'neha@example.com', 'passwordabc', 'Physics'),
  (11, 'Dr. Amit Shah', 'amit@example.com', 'passmno', 'Physics'),
  (12, 'Prof. Karishma Reddy', 'karishma@example.com', 'passqwe', 'Computer Science'),
  (13, 'Dr. Sanjay Verma', 'sanjay@example.com', 'passasd', 'Computer Science'),
  (14, 'Prof. Smita Mehta', 'smita@example.com', 'passzxc', 'Computer Science');
  
INSERT INTO Question (question_id, student_id, question_text, post_date,question_subject)
VALUES
  (1, 1, 'Question1', '2023-07-01', 'Mathematics'),
  (2, 2, 'Question2', '2023-07-02', 'Mathematics'),
  (3, 3, 'Question3', '2023-07-03', 'Physics'),
  (4, 4, 'Question4', '2023-07-04', 'Computer Science'),
  (5, 5, 'Question5', '2023-07-05', 'Computer Science'),
  (6, 1, 'Question6', '2023-07-06', 'Physics'),
  (7, 2, 'Question7', '2023-07-07', 'Chemistry'),
  (8, 3, 'Question8', '2023-07-08', 'Chemistry'),
  (9, 4, 'Question9', '2023-07-09', 'Mathematics'),
  (10, 5, 'Question10', '2023-07-10', 'Computer Science');
  
INSERT INTO Statistics (expert_id, question_solved, upvotes, downvotes, quality_score, satisfaction_rate)
VALUES
  (1, 50, 10, 6, 95, 90),
  (2, 40, 14, 5, 92, 85),
  (3, 60, 12, 9, 94, 88),
  (4, 35, 14, 7, 90, 80),
  (5, 45, 10, 9, 88, 82),
  (6, 55, 11, 6, 91, 86),
  (7, 70, 14, 8, 93, 87),
  (8, 30, 13, 6, 89, 81),
  (9, 25, 15, 7, 87, 75),
  (10, 50, 18, 10, 92, 85),
  (11, 20, 6, 4, 86, 77),
  (12, 45, 12, 9, 89, 80),
  (13, 40, 17, 8, 88, 79),
  (14, 35, 13, 7, 87, 76);

INSERT INTO Answer (answer_id, expert_id, question_id, answer_text, post_date)
VALUES
  (1, 1, 1, 'answer1', '2023-07-02'),
  (2, 2, 1, 'answer2', '2023-07-03'),
  (3, 3, 2, 'answer3', '2023-07-04'),
  (4, 4, 3, 'answer4', '2023-07-05'),
  (5, 5, 4, 'answer5', '2023-07-06'),
  (6, 6, 5, 'answer6', '2023-07-07'),
  (7, 7, 6, 'answer7', '2023-07-08'),
  (8, 8, 7, 'answer8', '2023-07-09'),
  (9, 9, 8, 'answer9', '2023-07-10'),
  (10, 10, 9, 'answer10', '2023-07-11'),
  (11, 1, 10, 'answer11', '2023-07-12'),
  (12, 2, 2, 'answer12', '2023-07-13'),
  (13, 3, 3, 'answer13', '2023-07-14'),
  (14, 4, 4, 'answer14', '2023-07-15'),
  (15, 5, 5, 'answer15', '2023-07-16'),
  (16, 6, 6, 'answer16', '2023-07-17'),
  (17, 7, 7, 'answer17', '2023-07-18'),
  (18, 8, 8, 'answer18', '2023-07-19'),
  (19, 9, 9, 'answer19', '2023-07-20'),
  (20, 10, 10, 'answer20', '2023-07-21');
  
INSERT INTO Vote (vote_id, student_id, answer_id, vote_value)
VALUES
  (1, 1, 1, 1),
  (2, 2, 1, 1),
  (3, 3, 2, -1),
  (4, 4, 3, 1),
  (5, 5, 3, 1),
  (6, 1, 4, -1),
  (7, 2, 5, 1),
  (8, 3, 5, 1),
  (9, 4, 6, 1),
  (10, 5, 7, -1),
  (11, 1, 8, 1),
  (12, 2, 8, 1);
  
INSERT INTO Comments (comment_id, student_id,  answer_id, comment_text, post_date)
VALUES
  (1, 1, 1,  'comment1', '2023-07-02'),
  (2, 2, 1, 'comment2', '2023-07-03'),
  (3, 3, 2,  'comment1', '2023-07-04'),
  (4, 4, 3,  'comment2', '2023-07-05'),
  (5, 5, 3,  'comment1', '2023-07-06'),
  (6, 1, 4, 'comment2', '2023-07-07'),
  (7, 2, 8,'comment1', '2023-07-08'),
  (8, 3, 2, 'comment2', '2023-07-09'),
  (9, 4, 5, 'comment1', '2023-07-10'),
  (10, 5, 7, 'comment2', '2023-07-11');
  
--   Questions posted by a particular student
  SELECT * FROM Question
  WHERE student_id=1;
  
--   Answers answered by a particular expert
  SELECT * FROM Answer
  WHERE expert_id=3;
  
  --   votes  by a particular student
  SELECT * FROM Vote
  WHERE student_id=2;
  
  --   comments posted by a particular student
  SELECT * FROM Comments
  WHERE student_id=4;
  
--   Answers to a particular question
  SELECT * FROM Answer
  WHERE question_id=1;
  
--   votes of an answer
  SELECT * FROM Vote
  WHERE answer_id=3;
  
--  comments of an answer
  SELECT * FROM Comments
  WHERE answer_id=3;
  
--  --answers answered by an expert followed by number of upvotes and downvotes
SELECT answer_id, COUNT(CASE WHEN vote_value = 1 THEN 1 END) AS upvotes, COUNT(CASE WHEN vote_value = -1 THEN 1 END) AS downvotes
FROM Vote
WHERE answer_id IN (SELECT answer_id FROM Answer WHERE expert_id=2)
GROUP BY answer_id;


-- --questions solved by an expert in last 15 days--
SELECT *
FROM Answer
WHERE Expert_id=1 and DATEDIFF(NOW(),post_date)<=15;

  




