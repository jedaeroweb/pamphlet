class Admins::SessionsController < Devise::SessionsController
  layout 'admin/login'

  def create
    self.resource = warden.authenticate!(auth_options)

    if resource && resource.admin?
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash[:alert] = "관리자 권한이 없습니다."
      sign_out(resource)
      redirect_to new_admin_session_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_root_path
    else
      flash[:alert] = "관리자 권한이 없습니다."
      sign_out(resource)
      new_admin_session_path
    end
  end

  def after_sign_out_path_for(_resource)
    new_admin_session_path
  end

end
