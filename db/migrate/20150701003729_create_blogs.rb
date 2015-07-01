class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false, :unique => true
      t.string :content, null: false
      t.string :display_id, null: false, :unique => true
      t.timestamps null: false
    end
    add_index :blogs, :display_id, :unique => true
  end
end
