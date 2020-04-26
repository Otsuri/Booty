class ContentsController < ApplicationController
  def index
    @contents = Content.all
  end

  def show
  end

  def new
    @content = Content.new
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
