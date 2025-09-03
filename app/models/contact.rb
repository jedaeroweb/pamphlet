class Contact < ActiveRecord::Base
  attr_accessor :name, :phone, :email, :raw_content
  has_rich_text :content

  belongs_to :user, :counter_cache => true
  belongs_to :contact_category, :counter_cache => true, :dependent=>:destroy
end
