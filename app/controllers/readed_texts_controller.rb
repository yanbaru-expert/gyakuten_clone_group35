class ReadedTextsController < ApplicationController
  def create
    current_user.readed_texts.create!(text_id: params[:text_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.readed_texts.find_by(text_id: params[:text_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end
