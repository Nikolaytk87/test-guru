# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
    @test = question.test
    @client = client || OctokitClient.new
  end

  def call
    gist_object
  end

  private

  def gist_object
    Struct.new('GistObject', :url, :success)
    response = @client.create_gist(gist_params)
    Struct::GistObject.new(response.html_url, @client.success?)
  end

  def gist_params
    { "description": I18n.t('label.gist_description', title: @test.title),
      "public": false,
      "files": {
        'test-guru-question.txt' => {
          content: gist_content
        }
      } }
  end

  def gist_content
    [@question.body, *@question.answers.pluck(:body)].join("\n")
  end
end
