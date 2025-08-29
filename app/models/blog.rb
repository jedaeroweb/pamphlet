class Blog < ActiveRecord::Base
  is_impressionable
  acts_as_taggable
  has_rich_text :content
  validates_presence_of :title, :description
  validates_length_of :title, :minimum => 4, :maximum => 60, :allow_blank => true
  belongs_to :user, :autosave=>true
  belongs_to :blog_category, :autosave=>true, :counter_cache => true
  mount_uploader :photo, BlogUploader
  
  def tag_list
    self.tags.map(&:name).join(', ')
  end
end
