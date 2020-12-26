class QuestionsController < ApplicationController
  def index
    @questions = Question.order(id: :desc)
    @question = Question.new
  end

  def show
    @question = Question.all
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.create!(question_params)
  end

  private

  def question_params
    params.require(:question).permit(:title, :detail)
  end
end
