class BlogCategory < ApplicationRecord
  has_many :blog, :dependent=>:destroy
  validates_presence_of :title
  validates_length_of :title, :minimum => 2, :maximum => 60, :allow_blank => true
end
