class Tag < ApplicationRecord
  has_many :contents_tags
  has_many :contents, through: :contents_tags
  
  validates :name, presence: true
end
