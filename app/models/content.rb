class Content < ApplicationRecord
  has_many :tags, dependent: :destroy
  
  has_many :contents_ttags
  has_many :ttags, through: :contents_ttags, dependent: :destroy
  # accepts_nested_attributes_for :contents_ttags
  
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :image, presence: true
  validates :detail, presence: true
end
