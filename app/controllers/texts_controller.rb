class TextsController < ApplicationController
  def index
    @q = Text.ransack(params[:q])
    @texts = @q.result
  end

  def show
    @text = Text.find(params[:id])
  end
end
