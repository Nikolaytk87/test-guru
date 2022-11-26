class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    response = GistQuestionService.new(@test_passage.current_question).call
    @gist = @test_passage.current_question.gists.new(user: current_user, url: response.html_url)
    redirect_to @test_passage, flash_options(response.html_url) if @gist.save
  end

  private

  def flash_options(url)
    if response.present?
      { notice: t('.success', link: gist_link(url)) }
    else
      { alert: t('.failure') }
    end
  end

  def gist_link(url)
    helpers.link_to(t('.to_save'), url, rel: 'noopener nofollow', target: '_blank')
  end
end
