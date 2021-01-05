class LinesController < ApplicationController
  def index
    @lines = Line.order(id: :asc)
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
    @line = Line.find(params[:id])
  end
    
  def update
    line = Line.find(params[:id])
    line.update!(line_params)
    redirect_to line
  end

  def destroy
    line = Line.find(params[:id])
    line.destroy!
    redirect_to root_path
  end
  
end
    
    
    

  
    
   



