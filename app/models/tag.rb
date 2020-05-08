class Tag < ApplicationRecord
  has_many :contents_tags
  has_many :contents, through: :contents_tags
  
  validates :name, presence: true, length: { maximum: 100 }, format: { with: /\A[a-zA-Z0-9ぁ-んァ-ン一-龥]+\z/ }
end
