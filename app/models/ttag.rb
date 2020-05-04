class Ttag < ApplicationRecord
  has_many :contents_ttags
  has_many :contents, through: :contents_ttags
  
  validates :name, presence: true
end
