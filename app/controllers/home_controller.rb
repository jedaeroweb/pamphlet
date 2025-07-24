# encoding: utf-8

class HomeController < ApplicationController
  def initialize(*params)
    super(*params)
    @script='home'
  end

  def index
    @notices = Notice.order('id desc').page(params[:page]).per(5)
    @galleries = Gallery.order('id desc').page(params[:page]).per(20)
    @blogs = Blog.order('id desc').where('photo IS NOT NULL').page(params[:page]).per(6)
  end
  
  def popup
    @meta_description=t(:meta_description_popup)  
  end
end