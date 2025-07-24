class Contact < ActiveRecord::Base
  validates_presence_of :name, :phone
  validates_length_of :name, :minimum => 2, :maximum => 60, :allow_blank => true
  validates_length_of :phone, :minimum => 2, :maximum => 60, :allow_blank => true  
  has_one :contact_content, :foreign_key => :id, :dependent => :destroy    
end
