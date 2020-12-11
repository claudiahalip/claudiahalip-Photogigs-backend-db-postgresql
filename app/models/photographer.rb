class Photographer < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :
  
end
