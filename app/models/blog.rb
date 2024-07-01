class Blog < ApplicationRecord
  validates :description, :category_ids, presence: true
  validates :headline, presence: true, uniqueness: { case_sensitive: true }
  has_rich_text :description
  has_one_attached :image
  has_many :blog_categories,dependent: :destroy
  has_many :categories, through: :blog_categories
  before_validation :generate_slug
  validates :slug, uniqueness: true, presence: true

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug ||= headline.parameterize
  end

end
