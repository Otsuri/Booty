class Content < ApplicationRecord
  
  has_many :contents_tags, dependent: :destroy
  has_many :tags, through: :contents_tags
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :image, presence: true
  validates :detail, presence: true
end
