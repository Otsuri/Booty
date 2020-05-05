class TtagsController < ApplicationController
  
  def create
    @content = Content.find(params[:content_id])
    @ttag = Ttag.new
    @ttag.contents << @content
    if @ttag.update(ttag_params)
      redirect_to content_path(@content), notice: 'Success!'
    else
      redirect_to content_path(@content), alert: 'Invalid!'
    end
  end
  
  def edit
    @content = Content.find(params[:content_id])
    @ttag = Ttag.find(params[:id])
  end
  
  def update
    @content = Content.find(params[:content_id])
    @ttag = Ttag.find(params[:id])
    
    if @ttag.update(ttag_params)
      redirect_to content_path(@content), notice: 'Success!'
    else
      flash.now[:alert] = 'Invalid!'
      render :edit
    end
  end
  
  def destroy
    @content = Content.find(params[:content_id])
    @ttag = Ttag.find(params[:id])
    
    @ttag.destroy
    redirect_to content_path(@content), notice: 'Success!'
  end
  
  private
  def ttag_params
    params.require(:ttag).permit(:name)
  end
end
