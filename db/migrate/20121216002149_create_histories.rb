class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user, :null=>false      
      t.string :year, :limit=>40, :null=>false
      t.string :title, :limit=>60, :null=>false
      t.text :content, :null=>false
      t.integer :count, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
