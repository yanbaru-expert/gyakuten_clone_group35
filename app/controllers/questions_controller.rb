class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    Question.create!(question_params)
  end

  def question_params
    params.permit(:title, :detail)
  end
end
