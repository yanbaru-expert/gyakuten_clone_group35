class LinesController < ApplicationController
  def index
  end

  def show
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
