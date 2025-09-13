class HomeController < ApplicationController
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

  def privacy
    render layout: false  # 레이아웃 없이 내용만 렌더링
  end

  def feed
    @blogs = Blog.all.where(:enable=>true)
    respond_to do |format|
      format.rss { render :layout => false }
    end
  end

  def popup
    @meta_description=t(:meta_description_popup)  
  end
end