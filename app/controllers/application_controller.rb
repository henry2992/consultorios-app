class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    if resource.admin? || resource.doctor?
      return docs_path
    else
      return root_path
    end
  end

  private
	# Layout per resource_name AND action
	def layout_by_resource
	  if devise_controller? && resource.doctor? && action_name == "edit" || action_name == "update" 
	    "doctors_app"
	  else
	    "application"
	  end
	end
end
