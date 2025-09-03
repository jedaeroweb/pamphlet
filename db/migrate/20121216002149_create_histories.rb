class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.references :user,null: false
      t.integer :year,  :null=>false
      t.integer :month
      t.string :title, :limit=>60, :null=>false
      t.text :content, :null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
    end
  end
end
