class Photographer < ApplicationRecord
  has_one_attached :avatar
  has_many :reviews, dependent: :destroy
  
end
