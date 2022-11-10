# frozen_string_literal: true

categories = Category.create!([{ title: 'SQL' }, { title: 'Python' }, { title: 'HTML' }, { title: 'CSS' }])

users = User.create!([{ name: 'Nick' }, { name: 'John' }, { name: 'Mark' }, { name: 'Mike' }, { name: 'Jane' }])

tests = Test.create!(
  [
    { title: 'SQL Basics', level: 1, category_id: categories[0].id, author_id: users[0].id },
    { title: 'SQL Advanced', level: 5, category_id: categories[0].id, author_id: users[0].id },
    { title: 'Python Advanced', level: 4, category_id: categories[1].id, author_id: users[0].id },
    { title: 'Python Basics', level: 4, category_id: categories[1].id, author_id: users[0].id },
    { title: 'Introduction to HTML', level: 2, category_id: categories[2].id, author_id: users[3].id },
    { title: 'Introduction to CCS3', level: 1, category_id: categories[3].id, author_id: users[3].id }
  ]
)

questions = Question.create!(
  [
    { body: 'What does HTML stand for?', test_id: tests[4].id },
    { body: 'Who is making the Web standards?', test_id: tests[4].id },
    { body: 'What is a correct syntax to output "Hello World" in Python?', test_id: tests[2].id },
    { body: 'How do you insert COMMENTS in Python code?', test_id: tests[3].id },
    { body: 'What does SQL stand for?', test_id: tests[0].id },
    { body: 'Which SQL statement is used to extract data from a database?', test_id: tests[1].id },
    { body: 'What does CSS stand for?', test_id: tests[5].id },
    { body: 'Where in an HTML document is the correct place to refer to external style sheet?', test_id: tests[5].id }
  ]
)

answers = Answer.create!(
  [
    { body: 'Hyper Text Markup Language', correct: true, question_id: questions[0].id },
    { body: 'Home Tool Markup Language', correct: false, question_id: questions[0].id },
    { body: 'Hyperlinks and Text Markup Language', question_id: questions[0].id },
    { body: 'Google', correct: false, question_id: questions[1].id },
    { body: 'Mozilla', correct: false, question_id: questions[1].id },
    { body: 'The World Wide Web Consortium', correct: true, question_id: questions[1].id },
    { body: 'Microsoft', correct: false, question_id: questions[1].id },
    { body: 'p("Hello World")', correct: false, question_id: questions[2].id },
    { body: 'echo("Hello World")', correct: false, question_id: questions[2].id },
    { body: 'print("Hello World")', correct: true, question_id: questions[2].id },
    { body: 'Hecho "Hello World"', correct: false, question_id: questions[2].id },
    { body: '#This is a comment', correct: true, question_id: questions[3].id },
    { body: '/*This is a comment*/', correct: false, question_id: questions[3].id },
    { body: '//This is a comment', correct: false, question_id: questions[3].id },
    { body: 'Structures Question Language', correct: false, question_id: questions[4].id },
    { body: 'Structured Query Language', correct: true, question_id: questions[4].id },
    { body: 'Strong Question Language', correct: false, question_id: questions[4].id },
    { body: 'SELECT', correct: true, question_id: questions[5].id },
    { body: 'EXTRACT ', correct: false, question_id: questions[5].id },
    { body: 'OPEN', correct: false, question_id: questions[5].id },
    { body: 'GET', correct: false, question_id: questions[5].id },
    { body: 'Cascading Style Sheets', correct: true, question_id: questions[6].id },
    { body: 'Computer Style Sheets', correct: false, question_id: questions[6].id },
    { body: 'Creative Style Sheets', correct: false, question_id: questions[6].id },
    { body: 'Colorful Style Sheets', correct: false, question_id: questions[6].id },
    { body: 'At the end of the document', correct: false, question_id: questions[7].id },
    { body: 'In the <body> section', correct: false, question_id: questions[7].id },
    { body: 'In the <head> section', correct: true, question_id: questions[7].id }
  ]
)
