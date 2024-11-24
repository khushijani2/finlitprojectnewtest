INSERT INTO token (token_type) VALUES ('BEARER');

INSERT INTO personalization_question_bank (question, options, difficulty_level, question_type) VALUES
('What is a budget?', '[{"optionId":"A","optionValue":"A plan for spending money"}, {"optionId":"B","optionValue":"A type of investment"}, {"optionId":"C","optionValue":"A savings account"}, {"optionId":"D","optionValue":"A loan"}]', 'easy', 'multiple-choice'),
('Saving money is important for financial stability.', '', 'easy', 'true-false'),
('The money you earn from working is called your _______.', '', 'easy', 'fill-in-the-blank'),
('What is a checking account used for?', '[{"optionId":"A","optionValue":"Saving money"}, {"optionId":"B","optionValue":"Daily transactions"}, {"optionId":"C","optionValue":"Investing in stocks"}, {"optionId":"D","optionValue":"Paying taxes"}]', 'easy', 'multiple-choice'),
('Credit cards always have lower interest rates than loans.', '', 'easy', 'true-false'),
('What is the purpose of an emergency fund?', '', 'easy', 'short-answer'),
('Which of the following is a fixed expense?', '[{"optionId":"A","optionValue":"Groceries"}, {"optionId":"B","optionValue":"Rent"}, {"optionId":"C","optionValue":"Entertainment"}, {"optionId":"D","optionValue":"Clothing"}]', 'easy', 'multiple-choice'),
('A debit card allows you to borrow money from the bank.', '', 'easy', 'true-false'),
('The amount of money left after all expenses are paid is called _______.', '', 'easy', 'fill-in-the-blank'),
('What is the primary purpose of a savings account?', '[{"optionId":"A","optionValue":"To earn interest on deposited money"}, {"optionId":"B","optionValue":"To pay bills"}, {"optionId":"C","optionValue":"To invest in stocks"}, {"optionId":"D","optionValue":"To take out loans"}]', 'easy', 'multiple-choice'),
('What is a loan?', '[{"optionId":"A","optionValue":"Money you give to a friend"}, {"optionId":"B","optionValue":"Money you borrow and must pay back"}, {"optionId":"C","optionValue":"A type of savings account"}, {"optionId":"D","optionValue":"A gift from the bank"}]', 'easy', 'multiple-choice'),
('It is a good idea to have a budget to manage your finances.', '', 'easy', 'true-false'),
('The amount of money you owe to others is called _______.', '', 'easy', 'fill-in-the-blank'),
('What is an expense?', '[{"optionId":"A","optionValue":"Money you earn"}, {"optionId":"B","optionValue":"Money you spend"}, {"optionId":"C","optionValue":"Money you save"}, {"optionId":"D","optionValue":"Money you invest"}]', 'easy', 'multiple-choice'),
('It’s important to pay your bills on time to avoid late fees.', '', 'easy', 'true-false'),
('What is a savings goal?', '', 'easy', 'short-answer'),
('What is a credit score used for?', '[{"optionId":"A","optionValue":"To measure your height"}, {"optionId":"B","optionValue":"To determine your eligibility for loans and credit"}, {"optionId":"C","optionValue":"To calculate your taxes"}, {"optionId":"D","optionValue":"To track your spending"}]', 'easy', 'multiple-choice'),
('You should keep track of your spending to avoid overspending.', '', 'easy', 'true-false'),
('The money you save for future use is called _______.', '', 'easy', 'fill-in-the-blank'),
('What is the purpose of insurance?', '[{"optionId":"A","optionValue":"To protect against financial loss"}, {"optionId":"B","optionValue":"To earn interest"}, {"optionId":"C","optionValue":"To pay off debt"}, {"optionId":"D","optionValue":"To invest in stocks"}]', 'easy', 'multiple-choice');



INSERT INTO personalization_answers (personalization_question_id, answer) VALUES
((SELECT id FROM personalization_question_bank WHERE question = 'What is a budget?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'Saving money is important for financial stability.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'The money you earn from working is called your _______.') , 'income'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a checking account used for?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'Credit cards always have lower interest rates than loans.'), 'False'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of an emergency fund?'), 'To cover unexpected expenses'),
((SELECT id FROM personalization_question_bank WHERE question = 'Which of the following is a fixed expense?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'A debit card allows you to borrow money from the bank.'), 'False'),
((SELECT id FROM personalization_question_bank WHERE question = 'The amount of money left after all expenses are paid is called _______.') , 'net income'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the primary purpose of a savings account?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a loan?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'It is a good idea to have a budget to manage your finances.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'The amount of money you owe to others is called _______.') , 'debt'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is an expense?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'It’s important to pay your bills on time to avoid late fees.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a savings goal?'), '["specific", "amount", "money", "save", "purpose"]'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a credit score used for?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'You should keep track of your spending to avoid overspending.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'The money you save for future use is called _______.') , 'savings'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of insurance?'), 'A');



INSERT INTO personalization_question_bank (question, options, difficulty_level, question_type) VALUES
('What is the difference between gross income and net income?', '[{"optionId":"A","optionValue":"Gross income is after taxes; net income is before taxes"}, {"optionId":"B","optionValue":"Gross income is before taxes; net income is after taxes"}, {"optionId":"C","optionValue":"Gross income includes bonuses; net income does not"}, {"optionId":"D","optionValue":"Gross income is monthly; net income is yearly"}]', 'intermediate', 'multiple-choice'),
('Diversifying your investments can reduce risk.', '', 'intermediate', 'true-false'),
('A _______ is a financial plan that helps you manage your income, expenses, and savings.', '', 'intermediate', 'fill-in-the-blank'),
('What is an interest rate?', '[{"optionId":"A","optionValue":"The cost of borrowing money"}, {"optionId":"B","optionValue":"The amount of money saved"}, {"optionId":"C","optionValue":"The total amount of a loan"}, {"optionId":"D","optionValue":"The principal amount of a loan"}]', 'intermediate', 'multiple-choice'),
('A 401(k) is a type of retirement savings plan.', '', 'intermediate', 'true-false'),
('What is the process of spreading your investments across different asset classes called?', '', 'intermediate', 'fill-in-the-blank'),
('What is a mutual fund?', '[{"optionId":"A","optionValue":"A type of savings account"}, {"optionId":"B","optionValue":"A pool of money from many investors to buy securities"}, {"optionId":"C","optionValue":"A loan from a bank"}, {"optionId":"D","optionValue":"A type of insurance"}]', 'intermediate', 'multiple-choice'),
('What is the benefit of having a high credit score?', '', 'intermediate', 'short-answer'),
('What is a credit report?', '[{"optionId":"A","optionValue":"A summary of your credit history"}, {"optionId":"B","optionValue":"A list of your expenses"}, {"optionId":"C","optionValue":"A type of investment"}, {"optionId":"D","optionValue":"A savings account statement"}]', 'intermediate', 'multiple-choice'),
('Compound interest is interest earned on both the initial principal and the interest that has been added to it.', '', 'intermediate', 'true-false'),
('A _______ is a financial product that pays you interest in exchange for keeping your money in the account for a fixed period.', '', 'intermediate', 'fill-in-the-blank'),
('What is the purpose of a financial advisor?', '[{"optionId":"A","optionValue":"To help you manage your finances and investments"}, {"optionId":"B","optionValue":"To sell you insurance"}, {"optionId":"C","optionValue":"To lend you money"}, {"optionId":"D","optionValue":"To collect taxes"}]', 'intermediate', 'multiple-choice'),
('What is the benefit of having an emergency fund?', '', 'intermediate', 'short-answer'),
('What is a stock?', '[{"optionId":"A","optionValue":"A loan from a bank"}, {"optionId":"B","optionValue":"A share of ownership in a company"}, {"optionId":"C","optionValue":"A type of savings account"}, {"optionId":"D","optionValue":"A government bond"}]', 'intermediate', 'multiple-choice'),
('A high debt-to-income ratio can make it harder to get approved for loans.', '', 'intermediate', 'true-false'),
('The _______ is the amount of money you initially invest or borrow.', '', 'intermediate', 'fill-in-the-blank'),
('What is the purpose of a retirement account?', '[{"optionId":"A","optionValue":"To save money for future expenses"}, {"optionId":"B","optionValue":"To pay off debt"}, {"optionId":"C","optionValue":"To invest in real estate"}, {"optionId":"D","optionValue":"To save money for retirement"}]', 'intermediate', 'multiple-choice'),
('What is the difference between a savings account and a checking account?', '', 'intermediate', 'short-answer');


INSERT INTO personalization_answers (personalization_question_id, answer) VALUES
((SELECT id FROM personalization_question_bank WHERE question = 'What is the difference between gross income and net income?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'Diversifying your investments can reduce risk.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'A _______ is a financial plan that helps you manage your income, expenses, and savings.'), 'budget'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is an interest rate?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'A 401(k) is a type of retirement savings plan.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the process of spreading your investments across different asset classes called?'), 'diversification'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a mutual fund?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the benefit of having a high credit score?'), '["lower", "interest", "rates", "loans", "better", "credit", "terms"'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a credit report?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'Compound interest is interest earned on both the initial principal and the interest that has been added to it.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'A _______ is a financial product that pays you interest in exchange for keeping your money in the account for a fixed period.'), 'certificate of deposit (CD)'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of a financial advisor?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the benefit of having an emergency fund?'), '["financial", "security", "unexpected", "expenses"]'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a stock?'), 'B'),
((SELECT id FROM personalization_question_bank WHERE question = 'A high debt-to-income ratio can make it harder to get approved for loans.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'The _______ is the amount of money you initially invest or borrow.'), 'principal'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of a retirement account?'), 'D'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the difference between a savings account and a checking account?'), '["saving", "money", "interest", "daily", "transactions", "bill payments"]');

INSERT INTO personalization_question_bank (question, options, difficulty_level, question_type) VALUES
('What is the difference between a traditional IRA and a Roth IRA?', '[{"optionId":"A","optionValue":"Traditional IRA contributions are tax-deductible. Roth IRA contributions are not"}, {"optionId":"B","optionValue":"Roth IRA contributions are tax-deductible. Traditional IRA contributions are not"}, {"optionId":"C","optionValue":"Both are tax-deductible"}, {"optionId":"D","optionValue":"Neither are tax-deductible"}]', 'advanced', 'multiple-choice'),
('Capital gains tax is applied to the profit from the sale of an asset.', '', 'advanced', 'true-false'),
('The _______ is the central bank of the United States.', '', 'advanced', 'fill-in-the-blank'),
('What is the purpose of a balance sheet?', '[{"optionId":"A","optionValue":"To show a company’s financial position at a specific point in time"}, {"optionId":"B","optionValue":"To track daily expenses"}, {"optionId":"C","optionValue":"To calculate taxes"}, {"optionId":"D","optionValue":"To plan a budget"}]', 'advanced', 'multiple-choice'),
('What is the difference between a stock and a bond?', '', 'advanced', 'short-answer'),
('What is an ETF (Exchange-Traded Fund)?', '[{"optionId":"A","optionValue":"A type of mutual fund"}, {"optionId":"B","optionValue":"A type of stock"}, {"optionId":"C","optionValue":"A type of bond"}, {"optionId":"D","optionValue":"A type of savings account"}]', 'advanced', 'multiple-choice'),
('Inflation decreases the purchasing power of money over time.', '', 'advanced', 'true-false'),
('The _______ rate is the interest rate at which banks lend to each other overnight.', '', 'advanced', 'fill-in-the-blank'),
('What is the purpose of an income statement?', '[{"optionId":"A","optionValue":"To show a company’s revenues and expenses over a period of time"}, {"optionId":"B","optionValue":"To track daily expenses"}, {"optionId":"C","optionValue":"To calculate taxes"}, {"optionId":"D","optionValue":"To plan a budget"}]', 'advanced', 'multiple-choice'),
('What is the significance of the time value of money?', '', 'advanced', 'short-answer'),
('What is the primary purpose of the Securities and Exchange Commission (SEC)?', '[{"optionId":"A","optionValue":"To regulate the stock market"}, {"optionId":"B","optionValue":"To manage the federal budget"}, {"optionId":"C","optionValue":"To oversee banking operations"}, {"optionId":"D","optionValue":"To control inflation"}]', 'advanced', 'multiple-choice'),
('A dividend is a portion of a company’s earnings distributed to shareholders.', '', 'advanced', 'true-false'),
('What is a hedge fund?', '[{"optionId":"A","optionValue":"An investment fund that employs various strategies to earn active return for its investors"}, {"optionId":"B","optionValue":"A savings account"}, {"optionId":"C","optionValue":"A type of insurance"}, {"optionId":"D","optionValue":"A government bond"}]', 'advanced', 'multiple-choice'),
('The _______ is a measure of how much money a company earns from its core business operations.', '', 'advanced', 'fill-in-the-blank'),
('What is the purpose of a financial audit?', '[{"optionId":"A","optionValue":"To review and verify a company’s financial statements"}, {"optionId":"B","optionValue":"To manage investments"}, {"optionId":"C","optionValue":"To track personal expenses"}, {"optionId":"D","optionValue":"To calculate taxes"}]', 'advanced', 'multiple-choice'),
('What is a bond rating?', '[{"optionId":"A","optionValue":"A measure of the creditworthiness of a bond issuer"}, {"optionId":"B","optionValue":"A type of stock"}, {"optionId":"C","optionValue":"A savings account interest rate"}, {"optionId":"D","optionValue":"A measure of stock performance"}]', 'advanced', 'multiple-choice');


INSERT INTO personalization_answers (personalization_question_id, answer) VALUES
((SELECT id FROM personalization_question_bank WHERE question = 'What is the difference between a traditional IRA and a Roth IRA?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'Capital gains tax is applied to the profit from the sale of an asset.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'The _______ is the central bank of the United States.'), 'Federal Reserve'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of a balance sheet?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the difference between a stock and a bond?'), '["ownership", "loan", "company", "government"]'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is an ETF (Exchange-Traded Fund)?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'Inflation decreases the purchasing power of money over time.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'The _______ rate is the interest rate at which banks lend to each other overnight.'), 'federal funds'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of an income statement?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the significance of the time value of money?'), '["money", "present", "future", "earning capacity"]'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the primary purpose of the Securities and Exchange Commission (SEC)?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'A dividend is a portion of a company’s earnings distributed to shareholders.'), 'True'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a hedge fund?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'The _______ is a measure of how much money a company earns from its core business operations.'), 'operating income'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is the purpose of a financial audit?'), 'A'),
((SELECT id FROM personalization_question_bank WHERE question = 'What is a bond rating?'), 'A');



INSERT INTO learning_style_questionnaire (question, options, answers) VALUES
('When you study, do you prefer to:', 'A) Read aloud;B) Write notes;C) Use diagrams;D) Perform hands-on activities', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('In a classroom, you learn best by:', 'A) Listening to the teacher;B) Reading textbooks;C) Watching videos;D) Doing experiments', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('When you need to remember a phone number, you:', 'A) Repeat it out loud;B) Write it down;C) Visualize the numbers;D) Type it into your phone', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('You find it easiest to learn a new language by:', 'A) Listening to audio lessons;B) Reading books;C) Watching videos;D) Practicing speaking with others', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('When giving directions, you prefer to:', 'A) Explain verbally;B) Draw a map;C) Point out landmarks;D) Walk the person to the destination', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('During a lecture, you:', 'A) Focus on the speaker’s words;B) Take detailed notes;C) Watch the presentation slides;D) Engage in discussions', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('When you hear a song, you:', 'A) Remember the lyrics easily;B) Write down the lyrics;C) Visualize the music video;D) Tap your feet to the rhythm', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('To solve a problem, you:', 'A) Talk it through;B) Write down possible solutions;C) Draw diagrams;D) Use physical objects to model the problem', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('When you are given instructions, you prefer:', 'A) To hear them;B) To read them;C) To see a demonstration;D) To try it out yourself', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}'),
('In a group project, you:', 'A) Prefer discussing ideas;B) Prefer writing the report;C) Prefer creating visual aids;D) Prefer building or assembling the project', '{"A": "auditory", "C": "visual", "D": "kinesthetic"}');
