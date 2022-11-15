module TestsHelper
  def question_header(test, action)
    headers = { create: "Create New #{test.title} Question", edit: "Edit #{test.title} Question" }
    headers[action]
  end

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end

  def number_of_questions(test)
    test.questions.count
  end
end
