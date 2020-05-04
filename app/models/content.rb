class Content < ApplicationRecord
  has_many :tags, dependent: :destroy
  
  has_many :contents_ttags
  has_many :ttags, through: :contents_ttags, dependent: :destroy
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :image, presence: true
  validates :detail, presence: true
end
