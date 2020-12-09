class TextsController < ApplicationController
  @@BASIC_GENRE = ["Basic", "Git", "Ruby", "Ruby on Rails"]

  def index
    params[:genre] ||= @@BASIC_GENRE
    @q = Text.where(genre: params[:genre]).ransack(params[:q])
    @texts = @q.result
  end

  def show
    @text = Text.find(params[:id])
  end
end
