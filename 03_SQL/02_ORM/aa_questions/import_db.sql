PRAGMA foreign_keys = ON;

DROP TABLE question_follows;
DROP TABLE question_likes;
DROP TABLE replies;
DROP TABLE questions;
DROP TABLE users;



CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255),
  lname VARCHAR(255)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  associated_author INTEGER,
  
  FOREIGN KEY (associated_author) REFERENCES users(id)
);

CREATE TABLE question_follows (
  user_id INTEGER,
  question_id INTEGER
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT,
  question_id INTEGER,
  parent_reply_id INTEGER,
  user_id INTEGER,
  
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY(parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);


INSERT INTO
  users (fname, lname)
VALUES
  ('Kenny', 'Choi'),
  ('Will', 'Smith'),
  ('Brian', 'Ortega');

INSERT INTO
  questions (title, body, associated_author)
VALUES
  ('What is the admissions process like?', 'I was wondering what the admissions process will be like. I am interested in applying as soon as possible.', (SELECT id FROM users WHERE fname = 'Kenny' AND lname = 'Choi')),
  ('Where are you located?', 'I am located in a city outside of the bootcamp location (in SF). Do you recommend relocating for the duration of the bootcamp?', (SELECT id FROM users WHERE fname = 'Will' AND lname = 'Smith')),
  ('What kind of job can I expect to get after completing the bootcamp?', 'I have been working as a front end developer for the past two years and want to take my career to the next level. Will the bootcamp prepare me for taking on more complex software engineering positions?', (SELECT id FROM users WHERE fname = 'Brian' AND lname = 'Ortega'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id from users WHERE fname = 'Kenny' AND lname = 'Choi'), (SELECT id FROM questions WHERE title LIKE '%admissions%')),
  ((SELECT id from users WHERE fname = 'Will' AND lname = 'Smith'), (SELECT id FROM questions WHERE title LIKE '%located%')),
  ((SELECT id from users WHERE fname = 'Brian' AND lname = 'Ortega'), (SELECT id FROM questions WHERE title LIKE '%job%'))
  ;

INSERT INTO
  replies (user_id, question_id, body, parent_reply_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Kenny' AND lname = 'Choi'), (SELECT id FROM questions WHERE title LIKE '%located%'), 'I''ve decide to relocate in order to minimize commute times.', null),
  ((SELECT id FROM users WHERE fname = 'Will' AND lname = 'Smith'), (SELECT id FROM questions WHERE title LIKE '%job%'), 'Absolutely. I''ve been working as a software engineering since graduating from App Academy in 2016.', null),
  ((SELECT id FROM users WHERE fname = 'Brian' AND lname = 'Ortega'), (SELECT id FROM questions WHERE title LIKE '%admissions%'), 'It''s not the easiest process in the world, but if you really buckle down and study your ruby fundamentals, you should have a decent chance of acceptance. Good luck!', null);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Kenny' AND lname = 'Choi'), (SELECT id FROM questions WHERE title LIKE '%job%')),
  ((SELECT id FROM users WHERE fname = 'Kenny' AND lname = 'Choi'), (SELECT id FROM questions WHERE title LIKE '%located%')),
  ((SELECT id FROM users WHERE fname = 'Will' AND lname = 'Smith'), (SELECT id FROM questions WHERE title LIKE '%job%')),
  ((SELECT id FROM users WHERE fname = 'Brian' AND lname = 'Ortega'), (SELECT id FROM questions WHERE title LIKE '%admissions%')),
  ((SELECT id FROM users WHERE fname = 'Brian' AND lname = 'Ortega'), (SELECT id FROM questions WHERE title LIKE '%job%'));

