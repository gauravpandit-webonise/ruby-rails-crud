class Post < ApplicationRecord

  extend FriendlyId

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  friendly_id :title, use: %i[slugged history]

  def generate_new_friendly_id?
    title_changed? || slug.blank?
  end
end
