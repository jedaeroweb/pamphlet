class BlogCategory < ActiveRecord::Base
  validates_presence_of :title
  validates_length_of :title, :minimum => 1, :maximum => 60, :allow_blank => true  
  belongs_to :blog_category
  has_many :blog_category, :dependent=>:destroy
  has_many :blog, :dependent=>:destroy
#  translates :title
end
