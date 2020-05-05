class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]
  
  def index
    @contents = Content.all.order(created_at: :desc)
  end

  def show
    @tag = Tag.new
    @ttag = Ttag.new
  end

  def new
    @content = Content.new
  end

  def edit
  end
  
  def update
    if @content.update(content_params)
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :edit
    end
  end
  
  def destroy
    ttagids = []
    @content.contents_ttags.each do |contents_tag|
      ttagids.push(contents_tag.ttag.id)
    end
    @content.destroy
    
    @contents_ttag = ContentsTtag.all
    ttagids.each do |ttagid|
      if @contents_ttag.any? {|ct| ct.ttag_id == ttagid}
      else
        @ttag = Ttag.find(ttagid)
        @ttag.destroy
      end
    end
    
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
  
  def set_content
    @content = Content.find(params[:id])
  end
  
  def content_params
    params.require(:content).permit(:title, :image, :detail)
  end
  
end
