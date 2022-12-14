# frozen_string_literal: true

categories = Category.create!([{ title: 'SQL' }, { title: 'Python' }, { title: 'HTML' }, { title: 'CSS' }])

users = User.create!([{ email: 'nick@example.com', password: 'qwerty123' },
                      { password: 'qwerty123', email: 'john@example.com' },
                      { email: 'mark@example.com', password: 'qwerty123' },
                      { password: 'qwerty123', email: 'mike@example.com' },
                      { email: 'jane@example.com', password: 'qwerty123' }])

admin = Admin.create!(email: 'admin@example.com', password: 'qwerty123', first_name: 'Nick', last_name: 'Nelson')

tests = Test.create!(
  [
    { title: 'SQL Basics', level: 1, category: categories[0], author: users[0] },
    { title: 'SQL Advanced', level: 5, category: categories[0], author: users[0] },
    { title: 'Python Advanced', level: 4, category: categories[1], author: users[0] },
    { title: 'Python Basics', level: 4, category: categories[1], author: users[0] },
    { title: 'Introduction to HTML', level: 2, category: categories[2], author: users[3] },
    { title: 'Introduction to CCS3', level: 1, category: categories[3], author: users[3] }
  ]
)

questions = Question.create!(
  [
    { body: 'What does HTML stand for?', test: tests[4] },
    { body: 'Who is making the Web standards?', test: tests[4] },
    { body: 'Choose the correct HTML element for the largest heading:', test: tests[4] },
    { body: 'What is a correct syntax to output "Hello World" in Python?', test: tests[2] },
    { body: 'How do you insert COMMENTS in Python code?', test: tests[3] },
    { body: 'What does SQL stand for?', test: tests[0] },
    { body: 'Which SQL statement is used to extract data from a database?', test: tests[1] },
    { body: 'What does CSS stand for?', test: tests[5] },
    { body: 'Where in an HTML document is the correct place to refer to external style sheet?', test: tests[5] }
  ]
)

answers = Answer.create!(
  [
    { body: 'Hyper Text Markup Language', correct: true, question: questions[0] },
    { body: 'Home Tool Markup Language', correct: false, question: questions[0] },
    { body: 'Hyperlinks and Text Markup Language', question: questions[0] },
    { body: 'Google', correct: false, question: questions[1] },
    { body: 'Mozilla', correct: false, question: questions[1] },
    { body: 'The World Wide Web Consortium', correct: true, question: questions[1] },
    { body: 'Microsoft', correct: false, question: questions[1] },
    { body: '<h6>', correct: false, question: questions[2] },
    { body: '<heading>', correct: false, question: questions[2] },
    { body: '<head>', correct: false, question: questions[2] },
    { body: '<h1>', correct: true, question: questions[2] },
    { body: 'p("Hello World")', correct: false, question: questions[3] },
    { body: 'echo("Hello World")', correct: false, question: questions[3] },
    { body: 'print("Hello World")', correct: true, question: questions[3] },
    { body: 'Hecho "Hello World"', correct: false, question: questions[3] },
    { body: '#This is a comment', correct: true, question: questions[4] },
    { body: '/*This is a comment*/', correct: false, question: questions[4] },
    { body: '//This is a comment', correct: false, question: questions[4] },
    { body: 'Structures Question Language', correct: false, question: questions[5] },
    { body: 'Structured Query Language', correct: true, question: questions[5] },
    { body: 'Strong Question Language', correct: false, question: questions[5] },
    { body: 'SELECT', correct: true, question: questions[6] },
    { body: 'EXTRACT ', correct: false, question: questions[6] },
    { body: 'OPEN', correct: false, question: questions[6] },
    { body: 'GET', correct: false, question: questions[6] },
    { body: 'Cascading Style Sheets', correct: true, question: questions[7] },
    { body: 'Computer Style Sheets', correct: false, question: questions[7] },
    { body: 'Creative Style Sheets', correct: false, question: questions[7] },
    { body: 'Colorful Style Sheets', correct: false, question: questions[7] },
    { body: 'At the end of the document', correct: false, question: questions[8] },
    { body: 'In the <body> section', correct: false, question: questions[8] },
    { body: 'In the <head> section', correct: true, question: questions[8] }
  ]
)

test_results = TestPassage.create(
  [
    { user_id: users[0].id, test: tests[0] },
    { user_id: users[1].id, test: tests[0] },
    { user_id: users[2].id, test: tests[0] },
    { user_id: users[0].id, test: tests[1] },
    { user_id: users[0].id, test: tests[2] },
    { user_id: users[2].id, test: tests[3] }
  ]
)

badges = Badge.create!(
  [
    { title: '???????????????? ?????????????????????? ???????? ???????????? ?????????????????? Python', image: 'category.png', rule_name: 'category?',
      rule_value: 'Python' },
    { title: '???????????? ?????? ?????????? ???????????? 1', image: 'level.png', rule_name: 'level?', rule_value: 1 },
    { title: '???????????? ???????? ?? ???????????? ??????????????', image: 'attempt.png', rule_name: 'attempt?', rule_value: 1 }
  ]
)
