class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  before_action :check_timer, only: %i[show update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      BadgeRewardService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def check_timer
    redirect_to result_test_passage_path(@test_passage), alert: t('label.end_time') if @test_passage.end_of_test_time?
  end
end
