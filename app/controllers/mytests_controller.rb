class MytestsController < ApplicationController
  def index
    @contents = Content.all.order(created_at: :desc)
    @contents_tags = ContentsTag.all.order(created_at: :desc)
    @tags = Tag.all.order(created_at: :desc)
  end
end
