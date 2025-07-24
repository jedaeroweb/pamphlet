class ContactCategory < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :minimum => 1, :maximum => 60, :allow_blank => true  
  belongs_to :contact_category
  has_many :contact_category, :dependent=>:destroy
  has_many :blog, :dependent=>:destroy
#  translates :title
end
