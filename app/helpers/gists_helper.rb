module GistsHelper
  BODY_LENGTH = 25

  def question_link(question)
    link_to question.body.truncate(BODY_LENGTH), admin_question_path(question)
  end

  def gist_link(gist)
    gist_hash = gist.url.split('/').last
    link_to gist_hash, gist.url, rel: 'noopener nofollow', target: '_blank'
  end
end
