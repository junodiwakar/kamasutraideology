class Blog < ApplicationRecord
  validates :headline,:description, presence: true
  has_rich_text :description
end
