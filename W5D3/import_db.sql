PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;

CREATE TABLE users( 
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER NOT NULL,
  
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply INTEGER,
  author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
    
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users(fname, lname)
VALUES
    ('Yuk', 'Chan'),
    ('Bryan', 'S');

INSERT INTO 
    questions(title, body, author_id)
VALUES
    ('title1', 'body1', (SELECT id FROM users WHERE fname = 'Yuk')),
    ('title2', 'body2', (SELECT id FROM users WHERE fname = 'Bryan'));

INSERT INTO
    question_follows(users_id, questions_id)
VALUES
    ((SELECT users.id FROM users WHERE fname = 'Yuk'),
    (SELECT questions.id FROM questions WHERE title = 'title1'));

INSERT INTO
    replies(question_id, parent_reply, author_id, body)
VALUES
    ((SELECT questions.id FROM questions WHERE title = 'title1'), 
    NULL,
    (SELECT users.id FROM users WHERE fname = 'Yuk'),
    'I am the body for reply'),
    ((SELECT questions.id FROM questions WHERE title = 'title2'), 
    NULL,
    (SELECT users.id FROM users WHERE fname = 'Bryan'),
    'I am the second body for reply');

INSERT INTO
    question_likes(user_id, question_id)
VALUES
    ((SELECT users.id FROM users WHERE fname = 'Yuk'),
    (SELECT questions.id FROM questions WHERE title = 'title1'));