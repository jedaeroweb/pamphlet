class CreateBlogCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_categories do |t|
      t.references :user, :null=>false
 #     t.references :blog_type, :null=>false
      t.references :blog_category  
      t.string :title, :null=>false, :limit=>60      
      t.integer :blogs_count, :null=>false, :default=>false
      t.integer :blog_categories_count, :null=>false, :default=>false      
      t.boolean :enable, :null=>false, :default=>true
      t.boolean :leaf, :default=>true
      t.timestamps :null=>false
    end
  end
end
