# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    @gist = GistQuestionService.new(@test_passage.current_question).call
    @test_passage.current_question.gists.create!(user: current_user, url: @gist.url)
    redirect_to @test_passage, flash_options
  end

  private

  def flash_options
    if @gist.success
      { notice: t('.success', link: gist_link(@gist.url)) }
    else
      { alert: t('.failure') }
    end
  end

  def gist_link(url)
    helpers.link_to(t('.to_save'), url, rel: 'noopener nofollow', target: '_blank')
  end
end
