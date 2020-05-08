class ContentsTag < ApplicationRecord
  belongs_to :content
  belongs_to :tag
  
  validates :content_id, uniqueness: { scope: :tag_id }
end
