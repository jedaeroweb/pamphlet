class CreateNotices < ActiveRecord::Migration[6.0]
  def change
    create_table :notices do |t|
      t.references :user,:null=>false
      t.string :title, :limit=>60, :null=>false
      t.boolean :enable, :null=>false, :default=>true
      t.integer :count, :null=>false, :default=>0
      t.timestamps :null=>false
    end
    
    create_table :notice_contents do |t|
      t.text :content,:null=>false
    end
  end
end
