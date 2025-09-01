class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.references :blog_category, null: false
      t.references :user, null: false
      t.string :title, null: false, limit: 60
      t.string :description, limit: 240
      t.integer :blog_pictures_count, null: false, default: 0
      t.integer :count, null: false, default: 0
      t.boolean :enable, null: false, default: true
      t.timestamps  null: false
    end
  end
end
