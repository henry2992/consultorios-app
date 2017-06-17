class Docs::DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_clinic!
  layout "doctors_app"

  def index
  end

  def authenticate_clinic!
    clinic = current_user.clinic
    if clinic&.status == false || !clinic
      redirect_to no_clinic_path 
    end
  end

  def ensure_json_request  
    return if request.format == :json
    render :nothing => true, :status => 406  
  end
end
