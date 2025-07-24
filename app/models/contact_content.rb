class ContactContent < ActiveRecord::Base
  validates_presence_of :content
  belongs_to :contact, :foreign_key => :id, :autosave=>true
  accepts_nested_attributes_for :contact, :allow_destroy => true
end
