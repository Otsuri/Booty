class ContentsController < ApplicationController
  def index
    @contents = Content.all.order(created_at: :desc)
  end

  def show
    @content = Content.find(params[:id])
    @tag = Tag.new
  end

  def new
    @content = Content.new
  end

  def edit
    @content = Content.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end
  
  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    redirect_to root_path, notice: 'Success!'
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
