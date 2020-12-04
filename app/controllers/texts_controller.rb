class TextsController < ApplicationController
  def index
    @texts = Text.all
    # current_user.id で readed_text の text_id を絞り込み @readed_text_ids に格納
    @readed_text_ids = ReadedText.where(user_id: current_user.id).pluck(:text_id)
  end

  def show
    @text = Text.find(params[:id])
  end
end
