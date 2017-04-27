class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.admin? || resource.doctor?
      return docs_path
    else
      return root_path
    end
  end
end
