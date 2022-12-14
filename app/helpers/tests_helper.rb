# frozen_string_literal: true

module TestsHelper
  def question_header(test, action)
    headers = { create: "Create New #{test.title} Question", edit: "Edit #{test.title} Question" }
    headers[action]
  end

  def current_year
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}}/#{repo}", target: '_blank',
                                                            rel: 'noopener nofollow'
  end

  def number_of_questions(test)
    test.questions.count
  end
end
