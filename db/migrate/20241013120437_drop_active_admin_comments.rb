class DropActiveAdminComments < ActiveRecord::Migration[7.1]
  def up
    drop_table :active_admin_comments if table_exists?(:active_admin_comments)
  end

  def down
    create_table :active_admin_comments do |t|
      t.string :namespace
      t.text :body
      t.string :resource_type
      t.bigint :resource_id
      t.string :author_type
      t.bigint :author_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
      t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
      t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
    end
  end
end
