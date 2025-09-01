# encoding: utf-8

class HomeController < ApplicationController
  def initialize(*params)
    super(*params)
    @script='home'
  end

  def index
    condition = { enable: true }

    @notices = Notice.order('id desc').page(params[:page]).per(5)
    @galleries = Gallery.order('id desc').page(params[:page]).per(6)
    @blog_count = Blog.where(condition).count
    @blogs = Blog.where(condition).page(0).per(6).order('id desc')
  end

  def demo
    render layout: false  # 레이아웃 없이 내용만 렌더링
  end

  def popup
    @meta_description=t(:meta_description_popup)  
  end
end