class Blog < ApplicationRecord
  validates :headline,:description, presence: true
  has_rich_text :description
  has_one_attached :image
  has_many :blog_categories
  has_many :categories, through: :blog_categories

end
