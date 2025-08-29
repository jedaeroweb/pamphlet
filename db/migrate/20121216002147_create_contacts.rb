class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.integer :contacts_count, :null=>false, :default=>0      
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps :null=>false
    end    
    
    create_table :contacts do |t|
      t.references :contact_category,:null=>false      
      t.string :name, :limit=>60, :null=>false
      t.string :phone, :limit=>40, :null=>false
      t.string :address ,:null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps :null=>false
    end
    
    create_table :contact_contents do |t|
      t.text :content,:null=>false
    end
  end
end
