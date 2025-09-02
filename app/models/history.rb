class History < ActiveRecord::Base
  validates_presence_of :year, :title
end
