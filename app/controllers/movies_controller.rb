class MoviesController < ApplicationController
  PER_PAGE = 12

  def index
    if params[:genre].present?
      @movies = Movie.where(genre: params[:genre]).page(params[:page])
    else
      @movies = Movie.where(genre: ["Basic", "Git", "HTML&CSS", "Ruby", "Ruby on Rails"]).page(params[:page])
    end
  end
end
