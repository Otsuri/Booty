class TagsController < ApplicationController
  before_action :set_content_and_tag, only: [:edit, :update, :destroy]
  
  def create
    @content = Content.find(params[:content_id])
    tag = Tag.all
    if tag.any?{ |t| t.name == tag_params[:name] }
      same_tag
    else
      @tag = Tag.new
      @tag.contents << @content
      tag_update
    end
  end
  
  def edit
    $url = request.url
  end
  
  def update
    tag = Tag.all
    if tag.any?{ |t| t.name == tag_params[:name] }
      if same_tag
        tag_destroy
      else
      end
    else
      tag_update
    end
  end
  
  def destroy
    tag_destroy
    redirect_to content_path(@content), notice: 'Success!'
  end
  
  def show
    @contents = Content.all
    
    contentids = []
    @contents.each do |content|
      if content.contents_tags.any?{ |cct| cct.tag_id == params[:id].to_i }
        contentids.push(content.id)
      end
    end
    
    @contents = Kaminari.paginate_array(Content.where(id: contentids).order(created_at: :desc)).page(params[:page]).per(5)
  end
  
  private
  
  def set_content_and_tag
    @content = Content.find(params[:content_id])
    @tag = Tag.find(params[:id])
  end
  
  def tag_update
    if @tag.update(tag_params)
      redirect_to content_path(@content), notice: 'Success!'
    else
      redirect_to $url, alert: 'Invalid!'
    end
  end
  
  def same_tag
    @contents_tag = ContentsTag.new
    same_tagid = Tag.find_by(name: tag_params[:name]).id
    
    if @contents_tag.update(content_id: params[:content_id], tag_id: same_tagid)
      redirect_to content_path(@content), notice:'Success!'
      return true
    else
      redirect_to $url, alert: 'Already exists!'
      return false
    end
  end
  
  def tag_destroy
    @contents_tag = ContentsTag.find_by(content_id: params[:content_id], tag_id: params[:id])
    @contents_tag.destroy
    
    contents_tag = ContentsTag.all
    
    if contents_tag.any?{ |ct| ct.tag_id == params[:id].to_i }
    else
      @tag.destroy
    end
  end
  
  def tag_params
    params.require(:tag).permit(:name)
  end
end
