class AddSlugToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :slug, :string
  end
end
