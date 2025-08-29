class Notice < ActiveRecord::Base
  is_impressionable
  has_rich_text :content
  validates_presence_of :title
  validates_length_of :title, minimum: 4, maximum: 60
  belongs_to :user, :autosave=>true
end
