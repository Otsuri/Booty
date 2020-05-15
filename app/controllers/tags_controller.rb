class TagsController < ApplicationController
  before_action :set_content_and_tag, only: [:edit, :update, :destroy]
  
  def create
    @content = Content.find(params[:content_id])
    
    tag = Tag.all
    if tag.any?{ |t| t.name == tag_params[:name] }
      
      @contents_tag = ContentsTag.new
      same_tagid = Tag.find_by(name: tag_params[:name]).id
      
      if @contents_tag.update(content_id: params[:content_id], tag_id: same_tagid)
        redirect_to content_path(@content), notice:'Success!'
      else
        redirect_to content_path(@content), alert: 'Already exists!'
      end
      
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
  end
  
  def update
    if @tag.update(tag_params)
      redirect_to content_path(@content), notice: 'Success!'
    else
      flash.now[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  def destroy
    @contents_tag = ContentsTag.find_by(content_id: params[:content_id], tag_id: params[:id])
    @contents_tag.destroy
    
    contents_tag = ContentsTag.all
    
    if contents_tag.any?{ |ct| ct.tag_id == params[:id].to_i }
    else
      @tag.destroy
    end
    
    redirect_to content_path(@content), notice: 'Success!'
  end
  
  private
  
  def set_content_and_tag
    @content = Content.find(params[:content_id])
    @tag = Tag.find(params[:id])
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
