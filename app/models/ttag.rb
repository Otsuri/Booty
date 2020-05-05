class Ttag < ApplicationRecord
  has_many :contents_ttags, dependent: :destroy
  has_many :contents, through: :contents_ttags
  
  validates :name, presence: true
end
