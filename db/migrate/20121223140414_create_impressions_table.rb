class CreateImpressionsTable < ActiveRecord::Migration[6.0]
  def self.up
    create_table :impressions, :force => true do |t|
      t.string :impressionable_type, :limit=>100
      t.integer :impressionable_id
      t.integer :user_id
      t.string :controller_name, :limit=>60
      t.string :action_name, :limit=>60
      t.string :view_name, :limit=>60
      t.string :request_hash, :limit=>130
      t.string :ip_address, :limit=>60
      t.string :session_hash, :limit=>100
      t.text :message
      t.text :referrer
      t.timestamps :null=>false
    end
    add_index :impressions, [:impressionable_type, :impressionable_id, :request_hash], :name => "poly_request_index", :unique => false
    add_index :impressions, [:impressionable_type, :impressionable_id, :ip_address], :name => "poly_ip_index", :unique => false
    add_index :impressions, [:impressionable_type, :impressionable_id, :session_hash], :name => "poly_session_index", :unique => false
    add_index :impressions, [:controller_name,:action_name,:request_hash], :name => "controlleraction_request_index", :unique => false
    add_index :impressions, [:controller_name,:action_name,:ip_address], :name => "controlleraction_ip_index", :unique => false
    add_index :impressions, [:controller_name,:action_name,:session_hash], :name => "controlleraction_session_index", :unique => false
    add_index :impressions, :user_id
  end

  def self.down
    drop_table :impressions
  end
end
