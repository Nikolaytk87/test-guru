# frozen_string_literal: true

categories = Category.create([{ title: 'SQL' }, { title: 'Python' }, { title: 'HTML' }, { title: 'CSS' }])

users = User.create([{ name: 'Nick' }, { name: 'John' }, { name: 'Mark' }, { name: 'Mike' }, { name: 'Jane' }])

tests = Test.create(
  [
    { title: 'SQL Basics', level: 1, category_id: categories[0].id, author_id: users[0].id },
    { title: 'Python Advanced', level: 4, category_id: categories[1].id, author_id: users[0].id },
    { title: 'Introduction to HTML', level: 2, category_id: categories[2].id, author_id: users[3].id },
    { title: 'Introduction to CCS3', level: 1, category_id: categories[3].id, author_id: users[3].id }
  ]
)

questions = Question.create(
  [
    { body: 'What does HTML stand for?', test_id: tests[2].id },
    { body: 'Who is making the Web standards?', test_id: tests[2].id },
    { body: 'What is a correct syntax to output "Hello World" in Python?', test_id: tests[1].id },
    { body: 'How do you insert COMMENTS in Python code?', test_id: tests[1].id },
    { body: 'What does SQL stand for?', test_id: tests[0].id },
    { body: 'Which SQL statement is used to extract data from a database?', test_id: tests[0].id },
    { body: 'What does CSS stand for?', test_id: tests[3].id },
    { body: 'Where in an HTML document is the correct place to refer to external style sheet?', test_id: tests[3].id }
  ]
)

answers = Answer.create(
  [
    { body: 'Hyper Text Markup Language', question_id: questions[0].id },
    { body: 'Home Tool Markup Language', question_id: questions[0].id },
    { body: 'Hyperlinks and Text Markup Language', question_id: questions[0].id },
    { body: 'Google', question_id: questions[1].id },
    { body: 'Mozilla', question_id: questions[1].id },
    { body: 'The World Wide Web Consortium', question_id: questions[1].id },
    { body: 'Microsoft', question_id: questions[1].id },
    { body: 'p("Hello World")', question_id: questions[2].id },
    { body: 'echo("Hello World")', question_id: questions[2].id },
    { body: 'print("Hello World")', question_id: questions[2].id },
    { body: 'Hecho "Hello World"', question_id: questions[2].id },
    { body: '#This is a comment', question_id: questions[3].id },
    { body: '/*This is a comment*/', question_id: questions[3].id },
    { body: '//This is a comment', question_id: questions[3].id },
    { body: 'Structures Question Language', question_id: questions[4].id },
    { body: 'Structured Query Language', question_id: questions[4].id },
    { body: 'Strong Question Language', question_id: questions[4].id },
    { body: 'SELECT', question_id: questions[5].id },
    { body: 'EXTRACT ', question_id: questions[5].id },
    { body: 'OPEN', question_id: questions[5].id },
    { body: 'GET', question_id: questions[5].id },
    { body: 'Cascading Style Sheets', question_id: questions[6].id },
    { body: 'Computer Style Sheets', question_id: questions[6].id },
    { body: 'Creative Style Sheets', question_id: questions[6].id },
    { body: 'Colorful Style Sheets', question_id: questions[6].id },
    { body: 'At the end of the document', question_id: questions[7].id },
    { body: 'In the <body> section', question_id: questions[7].id },
    { body: 'In the <head> section', question_id: questions[7].id }
  ]
)
