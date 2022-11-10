# frozen_string_literal: true

categories = Category.create!([{ title: 'SQL' }, { title: 'Python' }, { title: 'HTML' }, { title: 'CSS' }])

users = User.create!([{ name: 'Nick' }, { name: 'John' }, { name: 'Mark' }, { name: 'Mike' }, { name: 'Jane' }])

tests = Test.create!(
  [
    { title: 'SQL Basics', level: 1, category_id: categories[0], author_id: users[0] },
    { title: 'SQL Advanced', level: 5, category_id: categories[0], author_id: users[0] },
    { title: 'Python Advanced', level: 4, category_id: categories[1], author_id: users[0] },
    { title: 'Python Basics', level: 4, category_id: categories[1], author_id: users[0] },
    { title: 'Introduction to HTML', level: 2, category_id: categories[2], author_id: users[3] },
    { title: 'Introduction to CCS3', level: 1, category_id: categories[3], author_id: users[3] }
  ]
)

questions = Question.create!(
  [
    { body: 'What does HTML stand for?', test_id: tests[4] },
    { body: 'Who is making the Web standards?', test_id: tests[4] },
    { body: 'What is a correct syntax to output "Hello World" in Python?', test_id: tests[2] },
    { body: 'How do you insert COMMENTS in Python code?', test_id: tests[3] },
    { body: 'What does SQL stand for?', test_id: tests[0] },
    { body: 'Which SQL statement is used to extract data from a database?', test_id: tests[1] },
    { body: 'What does CSS stand for?', test_id: tests[5] },
    { body: 'Where in an HTML document is the correct place to refer to external style sheet?', test_id: tests[5] }
  ]
)

answers = Answer.create!(
  [
    { body: 'Hyper Text Markup Language', correct: true, question_id: questions[0] },
    { body: 'Home Tool Markup Language', correct: false, question_id: questions[0] },
    { body: 'Hyperlinks and Text Markup Language', question_id: questions[0] },
    { body: 'Google', correct: false, question_id: questions[1] },
    { body: 'Mozilla', correct: false, question_id: questions[1] },
    { body: 'The World Wide Web Consortium', correct: true, question_id: questions[1] },
    { body: 'Microsoft', correct: false, question_id: questions[1] },
    { body: 'p("Hello World")', correct: false, question_id: questions[2] },
    { body: 'echo("Hello World")', correct: false, question_id: questions[2] },
    { body: 'print("Hello World")', correct: true, question_id: questions[2] },
    { body: 'Hecho "Hello World"', correct: false, question_id: questions[2] },
    { body: '#This is a comment', correct: true, question_id: questions[3] },
    { body: '/*This is a comment*/', correct: false, question_id: questions[3] },
    { body: '//This is a comment', correct: false, question_id: questions[3] },
    { body: 'Structures Question Language', correct: false, question_id: questions[4] },
    { body: 'Structured Query Language', correct: true, question_id: questions[4] },
    { body: 'Strong Question Language', correct: false, question_id: questions[4] },
    { body: 'SELECT', correct: true, question_id: questions[5] },
    { body: 'EXTRACT ', correct: false, question_id: questions[5] },
    { body: 'OPEN', correct: false, question_id: questions[5] },
    { body: 'GET', correct: false, question_id: questions[5] },
    { body: 'Cascading Style Sheets', correct: true, question_id: questions[6] },
    { body: 'Computer Style Sheets', correct: false, question_id: questions[6] },
    { body: 'Creative Style Sheets', correct: false, question_id: questions[6] },
    { body: 'Colorful Style Sheets', correct: false, question_id: questions[6] },
    { body: 'At the end of the document', correct: false, question_id: questions[7] },
    { body: 'In the <body> section', correct: false, question_id: questions[7] },
    { body: 'In the <head> section', correct: true, question_id: questions[7] }
  ]
)

test_results = TestResult.create(
  [
    { user_id: users[0].id, test_id: tests[0] },
    { user_id: users[1].id, test_id: tests[0] },
    { user_id: users[2].id, test_id: tests[0] },
    { user_id: users[0].id, test_id: tests[1] },
    { user_id: users[0].id, test_id: tests[2] },
    { user_id: users[2].id, test_id: tests[3] }
  ]
)
