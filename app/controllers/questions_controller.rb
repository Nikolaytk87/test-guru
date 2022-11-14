class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: '<p>Questions for test number <%= @test.id %>:  <%=  @test.questions.pluck(:body) %></p>'
  end

  def show
    render inline: '<p>Question number <%= @question.id %>:  <%=  @question.body %></p>'
  end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @question.destroy
    render inline 'Question number <%= params[:id] removed %>'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question number #{params[:id]} not found"
  end
end
