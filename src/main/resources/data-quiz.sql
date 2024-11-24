---------------QUESTION TYPE TABLE
INSERT INTO question_types (question_type, points)
VALUES
('TRUE_FALSE', 10), 
('MULTIPLE_CHOICE', 20),
('FILL_IN_THE_BLANK', 20);

SET @true_false_id = (SELECT id FROM question_types where question_type = 'TRUE_FALSE');
SET @multiple_choice_id = (SELECT id FROM question_types where question_type = 'MULTIPLE_CHOICE');
SET @fill_in_the_blank_id = (SELECT id FROM question_types where question_type = 'FILL_IN_THE_BLANK');


---------------BEGINNER MODULE 1 - Introduction to Financial Literacy

INSERT INTO quizzes (quiz_level, category, age_range, prior_knowledge, info_needed, time_needed)
VALUES
('BEGINNER', 'Introduction to Financial Literacy', '10+', 'Minimal', 'Basic concepts', 'Short (1-2 hours per subtopic)');

-- Store the quiz ID in a variable
SET @quiz_id = (SELECT MAX(id) FROM quizzes);

-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Definition and Importance of Financial Literacy', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Financial Literacy', 'Understanding and effectively using various financial skills.', @topic_id),
('Importance', 'The significance of being financially literate in managing personal and professional finances.', @topic_id),
('Skills', 'Budgeting, saving, investing, and understanding credit.', @topic_id),
('Financial Stability', 'The ability to manage financial resources effectively to ensure long-term financial security.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Knowing how to create a budget and manage expenses.', @topic_id),
('Understanding how to save money for future needs.', @topic_id),
('Investing in stocks or bonds to grow wealth.', @topic_id),
('Using credit responsibly to maintain a good credit score.', @topic_id);

-- Insert questions and question_options for the topic
-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Financial literacy involves understanding and using various financial skills.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Financial literacy is not important for managing personal finances.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is financial literacy?', @multiple_choice_id, 'Understanding and using financial skills effectively.', @topic_id);
-- Store the question ID only if question_options will be inserted
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) The ability to read financial documents', @question_id),
('b) Understanding and using financial skills effectively', @question_id),
('c) Knowing how to spend money quickly', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Which of the following is a financial skill?', @multiple_choice_id, 'Budgeting', @topic_id);
-- Store the question ID only if question_options will be inserted
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Cooking', @question_id),
('b) Budgeting', @question_id),
('c) Painting', @question_id),
('d) Gardening', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Financial literacy involves understanding and using various financial _______.', @fill_in_the_blank_id, 'skills', @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('skills', @question_id),
('tools', @question_id),
('documents', @question_id),
('expenses', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Being financially literate helps in managing _______ and _______.', @fill_in_the_blank_id, 'expenses; savings', @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('income', @question_id),
('expenses', @question_id),
('savings', @question_id),
('investments', @question_id);





INSERT INTO topics (title, quiz_id)
VALUES ('Basic Financial Terms', @quiz_id);

-- Get the last inserted topic ID
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Inserting key terms
INSERT INTO key_terms (term, description, topic_id) VALUES
('Income', 'Money received, especially on a regular basis, for work or through investments.', @topic_id),
('Expenses', 'The cost required for something; the money spent on something.', @topic_id),
('Budget', 'An estimate of income and expenditure for a set period of time.', @topic_id),
('Savings', 'Money set aside for future use.', @topic_id);

-- Inserting topic_examples
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Your salary is your income, while your rent is an expense.', @topic_id),
('A budget helps you plan how to spend your income.', @topic_id),
('Savings can be used for emergencies or future investments.', @topic_id),
('Tracking expenses helps in managing your budget effectively.', @topic_id);

-- Inserting review questions one by one
-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id)
VALUES ('True/False: Income is money received, while expenses are costs required for something.', @true_false_id, 'True', @topic_id);

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id)
VALUES ('True/False: A budget is an estimate of income and expenditure for a set period of time.', @true_false_id, 'True', @topic_id);

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id)
VALUES ('Which of the following is an example of an expense?', @multiple_choice_id, 'Grocery bills', @topic_id);

-- Get the last inserted question ID for question_options
SET @question_id = (SELECT MAX(id) FROM questions);

-- Insert question_options for Question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) Salary', @question_id),
('b) Interest earned', @question_id),
('c) Grocery bills', @question_id),
('d) Dividends', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id)
VALUES ('Which of the following is a service offered by banks?', @multiple_choice_id, 'Providing loans', @topic_id);

-- Get the last inserted question ID for question_options
SET @question_id = (SELECT MAX(id) FROM questions);

-- Insert question_options for Question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Selling groceries', @question_id),
('b) Providing loans', @question_id),
('c) Offering travel packages', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id)
VALUES ('Income is money received, while _______ are costs required for something.', @fill_in_the_blank_id, 'expenses', @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('expenses', @question_id),
('savings', @question_id),
('investments', @question_id),
('budgets', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id)
VALUES ('Savings are money set aside for _______ use.', @fill_in_the_blank_id, 'future', @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('future', @question_id),
('current', @question_id),
('past', @question_id),
('immediate', @question_id);
















INSERT INTO topics (title, quiz_id)
VALUES ('Setting Financial Goals', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Financial Goals', 'Specific objectives to be achieved through financial planning.', @topic_id),
('Short-term Goals', 'Goals to be achieved within a year.', @topic_id),
('Long-term Goals', 'Goals to be achieved over a longer period, typically more than a year.', @topic_id),
('SMART Goals', 'Specific, Measurable, Achievable, Relevant, Time-bound.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Saving $500 for a new bicycle (short-term goal).', @topic_id),
('Saving for college tuition over the next five years (long-term goal).', @topic_id),
('Setting a goal to pay off credit card debt within six months.', @topic_id),
('Planning to save a certain amount each month for a vacation.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Financial goals are random wishes.', 'False', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Long-term goals are typically achieved over a period of more than a year.', 'True', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('What are financial goals?', 'Specific objectives to be achieved through financial planning.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Random wishes', @question_id),
('b) Specific objectives to be achieved through financial planning', @question_id),
('c) Daily tasks', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is an example of a SMART goal?', 'Save $500 in six months for a new bicycle.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Save money', @question_id),
('b) Save $500 in six months for a new bicycle', @question_id),
('c) Be rich', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Long-term goals are typically achieved over a period of more than _______.', 'a year', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('a month', @question_id),
('a year', @question_id),
('a week', @question_id),
('a day', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('SMART goals are Specific, Measurable, Achievable, Relevant, and _______.', 'Time-bound', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('Time-bound', @question_id),
('Temporary', @question_id),
('Tangible', @question_id),
('Timely', @question_id);











-- Insert into the topics table
INSERT INTO topics (title, quiz_id)
VALUES ('Understanding Income and Expenses', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Income', 'Money received regularly.', @topic_id),
('Expenses', 'Money spent on various needs and wants.', @topic_id),
('Fixed Expenses', 'Regular, unchanging expenses (e.g., rent).', @topic_id),
('Variable Expenses', 'Expenses that can change (e.g., groceries).', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Monthly salary vs. monthly grocery bills.', @topic_id),
('Rent (fixed expense) vs. dining out (discretionary expense).', @topic_id),
('Utility bills (fixed expense) vs. entertainment (variable expense).', @topic_id),
('Tracking income and expenses to create a budget.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Fixed expenses are regular and unchanging.', 'True', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Variable expenses are costs that remain the same each month.', 'False', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is an example of an expense?', 'Grocery bills.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Salary', @question_id),
('b) Interest earned', @question_id),
('c) Grocery bills', @question_id),
('d) Dividends', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is a variable expense?', 'Groceries.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Rent', @question_id),
('b) Mortgage', @question_id),
('c) Groceries', @question_id),
('d) Insurance', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Fixed expenses are regular and _______.', 'unchanging', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('unchanging', @question_id),
('variable', @question_id),
('discretionary', @question_id),
('flexible', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Expenses that can change are called _______ expenses.', 'variable', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('fixed', @question_id),
('variable', @question_id),
('discretionary', @question_id),
('essential', @question_id);













-- Insert into the topics table
INSERT INTO topics (title, quiz_id)
VALUES ('Budgeting Basics', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Budget', 'An estimate of income and expenditure for a set period of time.', @topic_id),
('Surplus', 'When income exceeds expenses.', @topic_id),
('Deficit', 'When expenses exceed income.', @topic_id),
('Balanced Budget', 'When income equals expenses.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Planning to spend $200 on groceries and $100 on entertainment each month.', @topic_id),
('Adjusting your budget to save more money.', @topic_id),
('Creating a budget to track monthly expenses.', @topic_id),
('Ensuring your budget is balanced to avoid debt.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: A budget is an estimate of income and expenditure for a set period of time.', 'True', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: A surplus occurs when expenses exceed income.', 'False', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('What is a surplus?', 'When income exceeds expenses.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) When expenses exceed income', @question_id),
('b) When income exceeds expenses', @question_id),
('c) When income equals expenses', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is an example of budgeting?', 'Planning to spend $200 on groceries each month.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Spending money without a plan', @question_id),
('b) Planning to spend $200 on groceries each month', @question_id),
('c) Ignoring your expenses', @question_id),
('d) None of the above', @question_id);

INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('A _______ is an estimate of income and expenditure for a set period of time.', 'budget', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('budget', @question_id),
('tools', @question_id),
('deficit', @question_id),
('expenses', @question_id);

INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('When expenses exceed income, it is called a _______.', 'deficit', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('surplus', @question_id),
('deficit', @question_id),
('budget', @question_id),
('balance', @question_id);








-- Insert into the topics table
INSERT INTO topics (title, quiz_id)
VALUES ('Saving Money', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Savings', 'Money set aside for future use.', @topic_id),
('Emergency Fund', 'Savings set aside for unexpected expenses.', @topic_id),
('Interest', 'Money earned on savings.', @topic_id),
('Compound Interest', 'Interest calculated on the initial principal and also on the accumulated interest of previous periods.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Putting $50 into a savings account each month.', @topic_id),
('Building an emergency fund to cover three months of living expenses.', @topic_id),
('Earning interest on a savings account.', @topic_id),
('Benefiting from compound interest over time.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Savings are money set aside for future use.', 'True', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: An emergency fund is money set aside for daily expenses.', 'False', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('What is an emergency fund?', 'Savings for unexpected expenses.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Money set aside for daily expenses', @question_id),
('b) Savings for unexpected expenses', @question_id),
('c) Money for entertainment', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Why is it important to save money?', 'To set aside money for future needs.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) To spend on luxury items', @question_id),
('b) To set aside money for future needs', @question_id),
('c) To lend to friends', @question_id),
('d) To hide from others', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Savings are money set aside for _______ use.', 'future', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('future', @question_id),
('current', @question_id),
('past', @question_id),
('immediate', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('A _______ account is a bank account that earns interest.', 'savings', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('checking', @question_id),
('savings', @question_id),
('loan', @question_id),
('credit', @question_id);








-- Insert into the topics table
INSERT INTO topics (title, quiz_id)
VALUES ('Introduction to Banking', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Banking', 'The business conducted or services offered by a bank.', @topic_id),
('Checking Account', 'A bank account used for daily transactions.', @topic_id),
('Savings Account', 'A bank account that earns interest.', @topic_id),
('ATM', 'Automated Teller Machine, used for banking transactions.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Opening a checking account to manage daily transactions.', @topic_id),
('Using an ATM to withdraw cash.', @topic_id),
('Depositing money into a savings account to earn interest.', @topic_id),
('Using online banking to manage accounts.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: A checking account is used for long-term savings.', 'False', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: An ATM is used for banking transactions.', 'True', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('What is a checking account used for?', 'Daily transactions.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Long-term savings', @question_id),
('b) Daily transactions', @question_id),
('c) Investing in stocks', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is a service offered by banks?', 'Providing loans.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Selling groceries', @question_id),
('b) Providing loans', @question_id),
('c) Offering travel packages', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('_______ is the business conducted or services offered by a bank.', 'Banking', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('Banking', @question_id),
('Shopping', @question_id),
('Investing', @question_id),
('Trading', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('An _______ is an Automated Teller Machine used for banking transactions.', 'ATM', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('ATM', @question_id),
('ITM', @question_id),
('POS', @question_id),
('EFT', @question_id);











INSERT INTO topics (title, quiz_id)
VALUES ('Understanding Credit', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Credit', 'The ability to borrow money or access goods or services with the understanding that you’ll pay later.', @topic_id),
('Credit Score', 'A numerical expression representing the creditworthiness of an individual.', @topic_id),
('Credit Report', 'A detailed report of an individual’s credit history.', @topic_id),
('Interest Rate', 'The percentage of a loan charged as interest to the borrower.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Using a credit card to buy a laptop and paying for it over time.', @topic_id),
('Checking your credit score to understand your creditworthiness.', @topic_id),
('Reviewing your credit report for accuracy.', @topic_id),
('Understanding the interest rate on a loan.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Credit is the ability to borrow money or access goods or services with the understanding that you’ll pay later.', 'True', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: A credit score is a measure of your income.', 'False', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('What is a credit score?', 'A numerical expression representing creditworthiness.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) A measure of your income', @question_id),
('b) A numerical expression representing creditworthiness', @question_id),
('c) A report of your expenses', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is an example of using credit?', 'Using a credit card to buy a laptop.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Paying with cash', @question_id),
('b) Using a credit card to buy a laptop', @question_id),
('c) Saving money', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('_______ is the ability to borrow money or access goods or services with the understanding that you’ll pay later.', 'Credit', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('Credit', @question_id),
('Debit', @question_id),
('Loan', @question_id),
('Savings', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('The _______ rate is the percentage of a loan charged as interest to the borrower.', 'interest', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('interest', @question_id),
('savings', @question_id),
('credit', @question_id),
('loan', @question_id);










INSERT INTO topics (title, quiz_id)
VALUES ('Financial Decision Making', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES
('Financial Decision Making', 'The process of making choices regarding the use of financial resources.', @topic_id),
('Opportunity Cost', 'The loss of potential gain from other alternatives when one alternative is chosen.', @topic_id),
('Risk', 'The possibility of losing money on an investment or business venture.', @topic_id),
('Return on Investment (ROI)', 'A measure of the profitability of an investment.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Deciding whether to spend money on a new phone or save it for future needs.', @topic_id),
('Evaluating the risk and return before investing in stocks.', @topic_id),
('Considering the opportunity cost of different financial decisions.', @topic_id),
('Analyzing the ROI of various investment question_options.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Financial decision making involves analyzing costs and benefits.', 'True', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('True/False: Opportunity cost is the cost of an opportunity.', 'False', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('What is opportunity cost?', 'The loss of potential gain from other alternatives when one alternative is chosen.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) The cost of an opportunity', @question_id),
('b) The loss of potential gain from other alternatives when one alternative is chosen', @question_id),
('c) The price of a product', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('Which of the following is an example of financial decision making?', 'Deciding whether to spend money on a new phone or save it.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES
('a) Deciding whether to spend money on a new phone or save it', @question_id),
('b) Ignoring financial choices', @question_id),
('c) Spending without planning', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('_______ is the process of making choices regarding the use of financial resources.', 'Financial decision making', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('Financial decision making', @question_id),
('Budgeting', @question_id),
('Investing', @question_id),
('Saving', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id)
VALUES ('_______ is a measure of the profitability of an investment.', 'ROI', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('ROI', @question_id),
('Risk', @question_id),
('Opportunity cost', @question_id),
('Budget', @question_id);








-- Insert into the topics table
INSERT INTO topics (title, quiz_id) 
VALUES ('Financial Planning', @quiz_id);

-- Store the topic_id in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert into the key_terms table
INSERT INTO key_terms (term, description, topic_id) VALUES 
('Financial Planning', 'The task of determining how a business will afford to achieve its strategic goals and objectives.', @topic_id),
('Budgeting', 'Creating a plan to spend your money.', @topic_id),
('Investing', 'Allocating money with the expectation of a future financial return.', @topic_id),
('Retirement Planning', 'Preparing for financial security in retirement.', @topic_id);

-- Insert into the topic_examples table
INSERT INTO topic_examples (example_text, topic_id) VALUES 
('Creating a plan to save for college tuition over the next five years.', @topic_id),
('Investing in a retirement fund to ensure financial security in old age.', @topic_id),
('Setting up a budget to manage monthly expenses.', @topic_id),
('Purchasing insurance to protect against financial loss.', @topic_id);

-- Insert into the questions table and question_options table
-- Question 1
INSERT INTO questions (question_text, answer, question_type_id, topic_id) 
VALUES ('True/False: Financial planning involves determining how to achieve strategic goals and objectives.', 'True', @true_false_id, @topic_id);

-- Question 2
INSERT INTO questions (question_text, answer, question_type_id, topic_id) 
VALUES ('True/False: Budgeting is spending money without a plan.', 'False', @true_false_id, @topic_id);

-- Question 3
INSERT INTO questions (question_text, answer, question_type_id, topic_id) 
VALUES ('What is budgeting?', 'Creating a plan to spend your money.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES 
('a) Spending money without a plan', @question_id),
('b) Creating a plan to spend your money', @question_id),
('c) Ignoring financial goals', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, answer, question_type_id, topic_id) 
VALUES ('Which of the following is an example of financial planning?', 'Creating a plan to save for college tuition.', @multiple_choice_id, @topic_id);
-- Get the question_id for question_options
SET @question_id = (SELECT MAX(id) FROM questions);
INSERT INTO question_options (option_text, question_id) VALUES 
('a) Creating a plan to save for college tuition', @question_id),
('b) Spending money impulsively', @question_id),
('c) Ignoring future financial needs', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, answer, question_type_id, topic_id) 
VALUES ('_______ is the task of determining how a business will afford to achieve its strategic goals and objectives.', 'Financial planning', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('Financial planning', @question_id),
('Budgeting', @question_id),
('Investing', @question_id),
('Saving', @question_id);

-- Question 6
INSERT INTO questions (question_text, answer, question_type_id, topic_id) 
VALUES ('_______ planning is preparing for financial security in retirement.', 'Retirement', @fill_in_the_blank_id, @topic_id);

SET @question_id = (SELECT MAX(id) FROM questions);

INSERT INTO question_options (option_text, question_id) VALUES
('Retirement', @question_id),
('Estate', @question_id),
('Insurance', @question_id),
('Budget', @question_id);


























---------------BEGINNER MODULE 2 - Banking Basics

INSERT INTO quizzes (quiz_level, category, age_range, prior_knowledge, info_needed, time_needed)
VALUES
('BEGINNER', 'Banking Basics', '12+', 'Minimal', 'Basic concepts', 'Short (1-2 hours per subtopic)');



-- Store the quiz ID in a variable
SET @quiz_id = (SELECT MAX(id) FROM quizzes);

-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Types of Bank Accounts', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Checking Account', 'A bank account used for daily transactions.', @topic_id),
('Savings Account', 'A bank account that earns interest.', @topic_id),
('Certificate of Deposit (CD)', 'A savings account with a fixed interest rate and fixed date of withdrawal.', @topic_id),
('Money Market Account', 'A type of savings account that typically offers higher interest rates in exchange for larger deposit amounts.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Using a checking account to pay for groceries.', @topic_id),
('Depositing money into a savings account to earn interest.', @topic_id),
('Opening a CD to save money for a fixed period.', @topic_id),
('Using a money market account to earn higher interest on larger deposits.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A checking account is used for daily transactions.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A savings account does not earn interest.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a Certificate of Deposit (CD)?', @multiple_choice_id, 'A savings account with a fixed interest rate and fixed date of withdrawal.', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) A type of checking account', @question_id),
('b) A savings account with a fixed interest rate and fixed date of withdrawal', @question_id),
('c) A loan from the bank', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Which type of account typically offers higher interest rates in exchange for larger deposit amounts?', @multiple_choice_id, 'Money Market Account', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Checking Account', @question_id),
('b) Savings Account', @question_id),
('c) Money Market Account', @question_id),
('d) Certificate of Deposit', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ account is used for daily transactions.', @fill_in_the_blank_id, 'checking', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('checking', @question_id),
('savings', @question_id),
('CD', @question_id),
('money market', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ account earns interest on the money deposited.', @fill_in_the_blank_id, 'savings', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('checking', @question_id),
('savings', @question_id),
('CD', @question_id),
('money market', @question_id);








-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('How to Open a Bank Account', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Identification', 'Documents required to verify your identity (e.g., driver’s license, passport).', @topic_id),
('Initial Deposit', 'The first amount of money deposited to open the account.', @topic_id),
('Account Application', 'A form that needs to be filled out to open a bank account.', @topic_id),
('Signature Card', 'A card that records your signature for verification purposes.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Providing a driver’s license and social security number to open an account.', @topic_id),
('Making an initial deposit of $50 to open a checking account.', @topic_id),
('Filling out an account application form at the bank.', @topic_id),
('Signing a signature card for identity verification.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Identification is not required to open a bank account.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: An initial deposit is usually required to open a bank account.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is an initial deposit?', @multiple_choice_id, 'The first amount of money deposited to open the account.', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) The first amount of money deposited to open the account', @question_id),
('b) The interest earned on a savings account', @question_id),
('c) The fee charged for opening an account', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Which document records your signature for verification purposes?', @multiple_choice_id, 'Signature Card', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Identification', @question_id),
('b) Account Application', @question_id),
('c) Signature Card', @question_id),
('d) Initial Deposit', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ is required to verify your identity when opening a bank account.', @fill_in_the_blank_id, 'identification', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('signature card', @question_id),
('identification', @question_id),
('initial deposit', @question_id),
('account application', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('The first amount of money deposited to open an account is called the _______.', @fill_in_the_blank_id, 'initial deposit', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('signature card', @question_id),
('identification', @question_id),
('initial deposit', @question_id),
('account application', @question_id);










INSERT INTO topics (title, quiz_id) VALUES
('Online Banking', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Online Banking', 'Managing bank accounts and transactions over the internet.', @topic_id),
('Username and Password', 'Credentials used to access online banking services.', @topic_id),
('Two-Factor Authentication', 'An additional security layer requiring two forms of identification.', @topic_id),
('Electronic Funds Transfer (EFT)', 'The electronic transfer of money from one bank account to another.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Checking your account balance online.', @topic_id),
('Transferring money between accounts using online banking.', @topic_id),
('Setting up two-factor authentication for added security.', @topic_id),
('Paying bills through electronic funds transfer.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Online banking allows you to manage your bank accounts over the internet.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Two-factor authentication is not necessary for online banking.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is required to access online banking services?', @multiple_choice_id, 'Username and Password', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) Username and Password', @question_id),
('b) Identification', @question_id),
('c) Signature Card', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What does EFT stand for?', @multiple_choice_id, 'Electronic Funds Transfer', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Electronic Funds Transfer', @question_id),
('b) Easy Funds Transfer', @question_id),
('c) Electronic Financial Transaction', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('_______ banking allows you to manage your bank accounts over the internet.', @fill_in_the_blank_id, 'Online', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('Online', @question_id),
('Mobile', @question_id),
('ATM', @question_id),
('Branch', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('An additional security layer requiring two forms of identification is called _______.', @fill_in_the_blank_id, 'two-factor authentication', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('username', @question_id),
('password', @question_id),
('two-factor authentication', @question_id),
('EFT', @question_id);








-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Understanding Bank Fees', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Maintenance Fee', 'A monthly fee charged for maintaining a bank account.', @topic_id),
('Overdraft Fee', 'A fee charged when you withdraw more money than you have in your account.', @topic_id),
('ATM Fee', 'A fee charged for using an ATM that does not belong to your bank.', @topic_id),
('Transaction Fee', 'A fee charged for each transaction made with your account.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Paying a monthly maintenance fee for a checking account.', @topic_id),
('Being charged an overdraft fee for spending more than your account balance.', @topic_id),
('Incurring an ATM fee for using a non-network ATM.', @topic_id),
('Paying a transaction fee for each debit card purchase.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A maintenance fee is charged monthly for maintaining a bank account.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: An overdraft fee is charged when you have sufficient funds in your account.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is an ATM fee?', @multiple_choice_id, 'A fee charged for using an ATM that does not belong to your bank', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) A fee charged for using an ATM that does not belong to your bank', @question_id),
('b) A fee charged for maintaining a bank account', @question_id),
('c) A fee charged for each transaction', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Which fee is charged for each transaction made with your account?', @multiple_choice_id, 'Transaction Fee', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Maintenance Fee', @question_id),
('b) Overdraft Fee', @question_id),
('c) ATM Fee', @question_id),
('d) Transaction Fee', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ fee is charged monthly for maintaining a bank account.', @fill_in_the_blank_id, 'maintenance', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('maintenance', @question_id),
('overdraft', @question_id),
('ATM', @question_id),
('transaction', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A fee charged when you withdraw more money than you have in your account is called an _______ fee.', @fill_in_the_blank_id, 'overdraft', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('maintenance', @question_id),
('overdraft', @question_id),
('ATM', @question_id),
('transaction', @question_id);





INSERT INTO topics (title, quiz_id) VALUES
('Using ATMs', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('ATM', 'Automated Teller Machine used for banking transactions.', @topic_id),
('PIN', 'Personal Identification Number used to access your account at an ATM.', @topic_id),
('Withdrawal', 'Taking money out of your bank account using an ATM.', @topic_id),
('Deposit', 'Putting money into your bank account using an ATM.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Using an ATM to withdraw cash.', @topic_id),
('Entering your PIN to access your account at an ATM.', @topic_id),
('Depositing a check using an ATM.', @topic_id),
('Checking your account balance at an ATM.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: An ATM is used for banking transactions.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A PIN is not required to access your account at an ATM.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a PIN used for?', @multiple_choice_id, 'To access your account at an ATM', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) To access your account at an ATM', @question_id),
('b) To open a bank account', @question_id),
('c) To apply for a loan', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a withdrawal?', @multiple_choice_id, 'Taking money out of your bank account', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Putting money into your bank account', @question_id),
('b) Taking money out of your bank account', @question_id),
('c) Checking your account balance', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('An _______ is used for banking transactions.', @fill_in_the_blank_id, 'ATM', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('ATM', @question_id),
('PIN', @question_id),
('EFT', @question_id),
('CD', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ is required to access your account at an ATM.', @fill_in_the_blank_id, 'PIN', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('PIN', @question_id),
('password', @question_id),
('username', @question_id),
('ID', @question_id);









-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Writing Checks', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Check', 'A written order directing a bank to pay money.', @topic_id),
('Payee', 'The person or entity to whom the check is written.', @topic_id),
('Endorsement', 'The signature on the back of a check authorizing it to be cashed or deposited.', @topic_id),
('Check Register', 'A record of all checks written and deposits made.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Writing a check to pay for rent.', @topic_id),
('Endorsing a check before depositing it.', @topic_id),
('Recording a check in your check register.', @topic_id),
('Writing a check to a payee for a service provided.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A check is a written order directing a bank to pay money.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Endorsement is not required for depositing a check.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Who is the payee on a check?', @multiple_choice_id, 'The person or entity to whom the check is written', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) The person writing the check', @question_id),
('b) The person or entity to whom the check is written', @question_id),
('c) The bank', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a check register used for?', @multiple_choice_id, 'To record all checks written and deposits made', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) To record all checks written and deposits made', @question_id),
('b) To apply for a loan', @question_id),
('c) To open a bank account', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ is a written order directing a bank to pay money.', @fill_in_the_blank_id, 'check', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('check', @question_id),
('deposit', @question_id),
('withdrawal', @question_id),
('endorsement', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('The signature on the back of a check authorizing it to be cashed or deposited is called an _______.', @fill_in_the_blank_id, 'endorsement', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('endorsement', @question_id),
('payee', @question_id),
('check', @question_id),
('register', @question_id);










-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Direct Deposit', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Direct Deposit', 'The electronic transfer of a payment directly from the payer’s account to the recipient’s account.', @topic_id),
('Payroll', 'The total amount of wages paid by a company to its employees.', @topic_id),
('Bank Routing Number', 'A nine-digit number used to identify a financial institution in a transaction.', @topic_id),
('Account Number', 'A unique number assigned to a bank account.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Receiving your salary through direct deposit.', @topic_id),
('Providing your bank routing number and account number to set up direct deposit.', @topic_id),
('Using direct deposit for tax refunds.', @topic_id),
('Setting up direct deposit for government benefits.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Direct deposit is the electronic transfer of a payment directly to the recipient’s account.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A bank routing number is not needed for direct deposit.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a bank routing number used for?', @multiple_choice_id, 'To identify a financial institution in a transaction', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) To identify a financial institution in a transaction', @question_id),
('b) To apply for a loan', @question_id),
('c) To open a bank account', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is direct deposit commonly used for?', @multiple_choice_id, 'Receiving salary', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Paying bills', @question_id),
('b) Receiving salary', @question_id),
('c) Applying for loans', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('_______ is the electronic transfer of a payment directly to the recipient’s account.', @fill_in_the_blank_id, 'Direct deposit', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('Direct deposit', @question_id),
('Withdrawal', @question_id),
('Deposit', @question_id),
('Transfer', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A unique number assigned to a bank account is called an _______ number.', @fill_in_the_blank_id, 'account', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('account', @question_id),
('routing', @question_id),
('identification', @question_id),
('transaction', @question_id);




-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Mobile Banking', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Mobile Banking', 'Managing bank accounts and transactions using a mobile device.', @topic_id),
('Mobile App', 'An application downloaded to a mobile device for banking purposes.', @topic_id),
('Mobile Deposit', 'Depositing checks using a mobile device by taking a photo of the check.', @topic_id),
('Push Notifications', 'Alerts sent to a mobile device to notify the user of account activity.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Checking your account balance using a mobile app.', @topic_id),
('Depositing a check using mobile deposit.', @topic_id),
('Receiving push notifications for account transactions.', @topic_id),
('Transferring money between accounts using a mobile device.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Mobile banking allows you to manage your bank accounts using a mobile device.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Mobile deposit requires visiting a bank branch.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a mobile app used for in banking?', @multiple_choice_id, 'To manage bank accounts and transactions', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) To manage bank accounts and transactions', @question_id),
('b) To apply for a loan', @question_id),
('c) To open a bank account', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is mobile deposit?', @multiple_choice_id, 'Depositing checks using a mobile device by taking a photo of the check', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Depositing checks using a mobile device by taking a photo of the check', @question_id),
('b) Depositing cash at an ATM', @question_id),
('c) Depositing checks at a bank branch', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('_______ banking allows you to manage your bank accounts using a mobile device.', @fill_in_the_blank_id, 'Mobile', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('Mobile', @question_id),
('Online', @question_id),
('ATM', @question_id),
('Branch', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Alerts sent to a mobile device to notify the user of account activity are called _______ notifications.', @fill_in_the_blank_id, 'push', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('push', @question_id),
('email', @question_id),
('text', @question_id),
('call', @question_id);









INSERT INTO topics (title, quiz_id) VALUES
('Bank Statements', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Bank Statement', 'A summary of financial transactions occurring over a given period on a bank account.', @topic_id),
('Transaction History', 'A record of all transactions made with a bank account.', @topic_id),
('Balance', 'The amount of money in a bank account at a given time.', @topic_id),
('Reconciliation', 'The process of ensuring that two sets of records (the bank statement and personal records) are in agreement.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Reviewing your bank statement to check for any unauthorized transactions.', @topic_id),
('Comparing your transaction history with your personal records.', @topic_id),
('Checking your account balance on your bank statement.', @topic_id),
('Reconciling your bank statement with your check register.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: A bank statement is a summary of financial transactions on a bank account.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Reconciliation is not necessary for managing a bank account.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is a bank statement?', @multiple_choice_id, 'A summary of financial transactions on a bank account', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) A summary of financial transactions on a bank account', @question_id),
('b) A loan application', @question_id),
('c) A check register', @question_id),
('d) None of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What is reconciliation?', @multiple_choice_id, 'The process of ensuring that two sets of records are in agreement', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) The process of ensuring that two sets of records are in agreement', @question_id),
('b) The process of opening a bank account', @question_id),
('c) The process of applying for a loan', @question_id),
('d) None of the above', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('A _______ statement is a summary of financial transactions on a bank account.', @fill_in_the_blank_id, 'bank', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('bank', @question_id),
('loan', @question_id),
('credit', @question_id),
('deposit', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('The process of ensuring that two sets of records are in agreement is called _______.', @fill_in_the_blank_id, 'reconciliation', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('reconciliation', @question_id),
('transaction', @question_id),
('balance', @question_id),
('statement', @question_id);






-- Insert data into topics
INSERT INTO topics (title, quiz_id) VALUES
('Choosing the Right Bank', @quiz_id);

-- Store the topic ID in a variable
SET @topic_id = (SELECT MAX(id) FROM topics);

-- Insert key terms for the topic
INSERT INTO key_terms (term, description, topic_id) VALUES
('Interest Rates', 'The percentage of interest paid by the bank on savings or charged on loans.', @topic_id),
('Bank Fees', 'Charges for various services provided by the bank.', @topic_id),
('Customer Service', 'The support provided by the bank to its customers.', @topic_id),
('Location and Accessibility', 'The convenience of the bank’s branches and ATMs.', @topic_id);

-- Insert topic_examples for the topic
INSERT INTO topic_examples (example_text, topic_id) VALUES
('Comparing interest rates offered by different banks.', @topic_id),
('Evaluating bank fees to choose the most cost-effective option.', @topic_id),
('Considering the quality of customer service when choosing a bank.', @topic_id),
('Selecting a bank with convenient branch locations and ATMs.', @topic_id);

-- Insert questions and question_options for the topic

-- Question 1
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Interest rates are the same at all banks.', @true_false_id, 'False', @topic_id);
-- No question_options for True/False question

-- Question 2
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('True/False: Customer service is an important factor when choosing a bank.', @true_false_id, 'True', @topic_id);
-- No question_options for True/False question

-- Question 3
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('What should you consider when choosing a bank?', @multiple_choice_id, 'd) All of the above', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 3
INSERT INTO question_options (option_text, question_id) VALUES
('a) Interest Rates', @question_id),
('b) Bank Fees', @question_id),
('c) Customer Service', @question_id),
('d) All of the above', @question_id);

-- Question 4
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Which factor relates to the convenience of the bank’s branches and ATMs?', @multiple_choice_id, 'c) Location and Accessibility', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert question_options for multiple choice question 4
INSERT INTO question_options (option_text, question_id) VALUES
('a) Interest Rates', @question_id),
('b) Bank Fees', @question_id),
('c) Location and Accessibility', @question_id),
('d) Customer Service', @question_id);

-- Question 5
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('The percentage of interest paid by the bank on savings or charged on loans is called _______ rates.', @fill_in_the_blank_id, 'interest', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 5
INSERT INTO question_options (option_text, question_id) VALUES
('interest', @question_id),
('bank', @question_id),
('customer', @question_id),
('service', @question_id);

-- Question 6
INSERT INTO questions (question_text, question_type_id, answer, topic_id) VALUES
('Charges for various services provided by the bank are called _______ fees.', @fill_in_the_blank_id, 'bank', @topic_id);
SET @question_id = (SELECT MAX(id) FROM questions);
-- Insert options for fill-in-the-blank question 6
INSERT INTO question_options (option_text, question_id) VALUES
('bank', @question_id),
('interest', @question_id),
('customer', @question_id),
('service', @question_id);