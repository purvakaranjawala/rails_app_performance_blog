class Comment < ApplicationRecord
  belongs_to :recipe, touch: true
  belongs_to :user, dependent: :destroy
  # belongs_to  :parent, class_name: 'Comment', optional: true
  # has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  # has_one_attached :main_image do |attachable|
  #   attachable.variant :thumb, resize: "100x100"
  #   attachable.variant :medium, resize: "300x300", monochrome: true
  # end

  after_create :save_commenter

  private

  def save_commenter
    self.commenter = user.name
    save!
  end
end
