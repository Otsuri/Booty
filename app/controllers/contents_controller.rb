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
    if @content.save
      redirect_to root_path, notice: 'Success!'
    else
      flash.now[:alert] = 'Save error!'
      render :new
    end
  end
  
  private
  
  def content_params
    params.require(:content).permit(:title, :image, :detail)
  end
  
end
