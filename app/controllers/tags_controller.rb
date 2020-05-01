class TagsController < ApplicationController
  
  def create
    @content = Content.find(params[:content_id])
    @tag = Tag.new
    if @tag.update(tag_params)
      redirect_to content_path(@content), notice: 'Success!'
    else
      redirect_to content_path(@content), alert: 'Invalid!'
    end
  end
  
  def edit
    @content = Content.find(params[:content_id])
    @tag = Tag.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:content_id])
    @tag = Tag.find(params[:id])
    
    if @tag.update(tag_params)
      redirect_to content_path(@content), notice: 'Success!'
    else
      flash.now[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  def destroy
    @content = Content.find(params[:content_id])
    @tag = Tag.find(params[:id])
    
    @tag.destroy
    redirect_to content_path(@content), notice: 'Success!'
  end
  
  private
  def tag_params
    params.require(:tag).permit(:name, :content_id)
  end
end
