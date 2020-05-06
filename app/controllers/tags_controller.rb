class TagsController < ApplicationController
  
  def create
    @content = Content.find(params[:content_id])
    
    tag = Tag.all
    if tag.any?{ |t| t.name == tag_params[:name] }
      
      @contents_tag = ContentsTag.new
      @contents_tag.update(content_id: params[:content_id], tag_id: Tag.find_by(name: tag_params[:name]).id)
      redirect_to content_path(@content), notice:'Success!'
      
    else
      
      @tag = Tag.new
      @tag.contents << @content
      if @tag.update(tag_params)
        redirect_to content_path(@content), notice: 'Success!'
      else
        redirect_to content_path(@content), alert: 'Invalid!'
      end
      
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
    params.require(:tag).permit(:name)
  end
end
