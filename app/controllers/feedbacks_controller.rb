class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!
  def new; end

  def create
    FeedbacksMailer.send_feedback(params[:email], params[:name], params[:msg]).deliver_now
    redirect_to root_path, notice: t('.success_send')
  end
end
