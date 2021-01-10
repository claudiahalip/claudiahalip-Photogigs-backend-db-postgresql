class Photographer < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
end
