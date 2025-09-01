class Blog < ApplicationRecord
  is_impressionable
  has_rich_text :content
  acts_as_taggable_on :tags

  validates_presence_of :title
  validates_length_of :title, :minimum => 2, :maximum => 60
  belongs_to :user
  belongs_to :blog_category, :autosave => true, :counter_cache => true
  has_one :blog_picture, dependent: :destroy
  accepts_nested_attributes_for :blog_picture, :allow_destroy => true
end
