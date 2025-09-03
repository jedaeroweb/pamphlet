class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_categories do |t|
      t.string :title, :null=>false, :limit=>60
      t.integer :contacts_count, :null=>false, :default=>0      
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps :null=>false
    end    
    
    create_table :contacts do |t|
      t.references :user,null: false
      t.references :contact_category,:null=>false
      t.boolean :enable, :null=>false, :default=>true      
      t.timestamps :null=>false
    end
  end
end
