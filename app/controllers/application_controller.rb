class ApplicationController < ActionController::Base
  layout :layout

  def initialize(*params)
    super(*params)

    @application_name=t(:application_name)
    @controller_name=t(:application_name)
    @title=t(:default_title)

    @meta_robot='all, index, follow'
    @meta_description=t(:meta_description)
    @meta_keywords=t(:meta_keywords)
    @meta_image=t(:meta_image)
    @meta_url=t(:meta_url)

    @page_itemtype="http://schema.org/WebPage"

    @aside_blog_categories = BlogCategory.where(:enable=>true)
    @tags = Blog.tag_counts_on(:tags, :limit => 20, :order => "taggings_count desc")

  end

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :notice => t(:login_first)
  end

  def layout
    if params[:no_layout]
      return false
    else
      return 'application'
    end
  end


  protected

  def admin_signed_in?
    user_signed_in? && current_user.admin?
  end

  def current_admin
    @current_admin ||= current_user if user_signed_in? && current_user.admin?
  end

  helper_method :admin_signed_in?, :current_admin
end
