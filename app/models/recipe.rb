class Recipe < ApplicationRecord
  has_one :receipe_info

  has_many :comments, dependent: :destroy
  validates :title, presence: true
end
