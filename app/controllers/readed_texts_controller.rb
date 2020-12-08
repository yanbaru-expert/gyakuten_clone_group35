class ReadedTextsController < ApplicationController
  def create
    @text_id = params[:text_id]
    current_user.readed_texts.create!(text_id: @text_id)
  end

  def destroy
    @text_id = params[:text_id]
    current_user.readed_texts.find_by(text_id: @text_id).destroy!
  end
end
