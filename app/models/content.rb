class Content < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :title, presence: true
    validates :image, presence: true
    validates :detail, presence: true
end
