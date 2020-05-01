class Tag < ApplicationRecord
  belongs_to :content
  validates :name, presence: true
end
