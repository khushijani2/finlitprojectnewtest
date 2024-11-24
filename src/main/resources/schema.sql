DROP TABLE IF EXISTS user_details;

CREATE TABLE IF NOT EXISTS user_details (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255),
    custom_username VARCHAR(255) UNIQUE,
    phonenumber VARCHAR(255),
    verified BOOLEAN DEFAULT false
);

CREATE TABLE IF NOT EXISTS password_reset_tokens (
    reset_token_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    reset_token VARCHAR(255),
    user_id BIGINT,
    expiration_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES user_details(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tokens (
    token_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    registration_token VARCHAR(255),
    login_code VARCHAR(255),
    user_id BIGINT,
    expiration_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES user_details(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS token (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    token VARCHAR(255),
    expired BOOLEAN,
    revoked BOOLEAN,
    token_type VARCHAR(255),
    user_id BIGINT,
    FOREIGN KEY (user_id) REFERENCES user_details(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS personalization_question_bank (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    question TEXT NOT NULL,
    options TEXT,
    difficulty_level TEXT CHECK (difficulty_level IN ('easy', 'intermediate', 'advanced')),
    question_type TEXT CHECK (question_type IN ('multiple-choice', 'true-false', 'fill-in-the-blank', 'short-answer'))
);


CREATE TABLE personalization_answers (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    personalization_question_id BIGINT UNSIGNED NOT NULL, -- Ensure this matches the referenced column type
    answer TEXT NOT NULL,
    FOREIGN KEY (personalization_question_id) REFERENCES personalization_question_bank(id) ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS learning_style_questionnaire (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    options TEXT,
    answers TEXT
);
