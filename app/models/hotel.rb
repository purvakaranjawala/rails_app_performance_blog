class Hotel < ApplicationRecord
  has_many :recipes
  has_many :addresses, as: :addressable
end
