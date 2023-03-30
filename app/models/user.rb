class User < ApplicationRecord
  has_many :comments, dependent: :delete_all

  has_many :addresses, as: :addressable

  validates :name, presence: true, length: { maximum: 25 }
end
