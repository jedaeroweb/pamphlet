class CreateBlogCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_categories do |t|
      t.references :blog_category  
      t.string :title, :null=>false, :limit=>60      
      t.integer :blogs_count, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
