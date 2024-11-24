DROP TABLE IF EXISTS options;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS key_terms;
DROP TABLE IF EXISTS examples;
DROP TABLE IF EXISTS topics;
DROP TABLE IF EXISTS quizzes;

CREATE TABLE quizzes (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    quiz_level VARCHAR(50) NOT NULL,
    category VARCHAR(255),
    age_range VARCHAR(50),
    prior_knowledge VARCHAR(100),
    info_needed VARCHAR(255),
    time_needed VARCHAR(100)
);

CREATE TABLE topics (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    quiz_id BIGINT,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

CREATE TABLE key_terms (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    term VARCHAR(255) NOT NULL,
    description TEXT,
    topic_id BIGINT,
    FOREIGN KEY (topic_id) REFERENCES topics(id) ON DELETE CASCADE
);

CREATE TABLE topic_examples (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    example_text TEXT,
    topic_id BIGINT,
    FOREIGN KEY (topic_id) REFERENCES topics(id) ON DELETE CASCADE
);

CREATE TABLE question_types (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    question_type VARCHAR(50),
    points INT NOT NULL
);

CREATE TABLE questions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    question_text TEXT NOT NULL,
    question_type_id BIGINT,
    answer TEXT,
    topic_id BIGINT,
    FOREIGN KEY (question_type_id) REFERENCES question_types(id) ON DELETE CASCADE,
    FOREIGN KEY (topic_id) REFERENCES topics(id) ON DELETE CASCADE
);

CREATE TABLE question_options (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    option_text TEXT,
    question_id BIGINT,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE
);









CREATE TABLE user_solved_questions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    question_id BIGINT NOT NULL,
    solved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_details(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE(user_id, question_id)
);

CREATE TABLE user_topic_cash_losses (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    quiz_id BIGINT NOT NULL,
    loss_time TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user_details(id) ON DELETE CASCADE,
    FOREIGN KEY (quiz_id) REFERENCES quizzes(id) ON DELETE CASCADE
);

CREATE TABLE user_xp_points (
    user_id BIGINT NOT NULL,
    xp_points INT,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES user_details(id) ON DELETE CASCADE
);