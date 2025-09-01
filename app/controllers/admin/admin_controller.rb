class Admin::AdminController < ApplicationController
  #load_and_authorize_resource except: [:create]
  load_and_authorize_resource


  def current_ability
    @current_ability ||= UserAbility.new(current_admin)
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:admin]
  end

  rescue_from CanCan::AccessDenied do |_exception|
    if current_admin
      render file: "#{Rails.root}/public/403.html", status: 403, layout: false
    else
      redirect_to new_admin_session_path
    end
  end

  def layout
    if params[:no_layout]
      false
    else
      if params[:popup]
        'admin/popup'
      else
        'admin/application'
      end
    end
  end
end
