class LinesController < ApplicationController
  def index
  end

  def show
    @line = Line.find(params[:id])
  end

  def new
    
      @line = Line.new
   
    end
  
    def create
    
      line = Line.create!(line_params)
      redirect_to line
   
    end
  def edit
  end

  def update
  end

  def destroy
  end
end
