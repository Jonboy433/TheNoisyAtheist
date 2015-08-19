class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.timestamps null: false
    end

    add_column :comments, :blog_id, :integer, null: false
    add_column :comments, :user_id, :integer, null: false
    add_index :comments, :blog_id
  end
end
