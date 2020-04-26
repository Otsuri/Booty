class ContentsController < ApplicationController
  def index
    @content = Content.new
  end

  def show
  end

  def new
  end

  def edit
  end
  
  def create
    @content = Content.new(content_params)
  end
  
  private
  
  def content_params
    params.require(:content).permit(:image)
  end
  
end
