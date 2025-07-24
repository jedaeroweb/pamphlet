# encoding: utf-8

require 'carrierwave/orm/activerecord'

class Portfolio < ActiveRecord::Base
  validates_presence_of :title, :url, :description, :photo
  validates_length_of :title, :minimum => 4, :maximum => 60, :allow_blank => true  
  has_one :portfolio_content, :foreign_key => :id, :dependent => :destroy
  accepts_nested_attributes_for :portfolio_content, :allow_destroy => true  
  mount_uploader :photo, PortfolioUploader
  
  def content
    self.portfolio_content.content
  end  
end
