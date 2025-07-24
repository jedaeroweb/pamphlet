class CreateUserPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_photos do |t|
      t.references :user, :null=>false
      t.string :photo, :null=>false
      t.string :alt,:limit=>60, :null=>false
      t.boolean :default, :null=>false, :default=>0
      t.boolean :enable, :null=>false, :default=>1
      t.timestamps :null=>false
    end
  end
end
