class LinesController < ApplicationController
  def index
    @lines = Line.order(id: :asc)
  end

  def show
    @line = Line.find(params[:id])
  end
  
end
    
    
    

  
    
   



