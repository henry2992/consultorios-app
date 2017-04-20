class Docs::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authenticate_clinic!

  def index
  end

  def authenticate_clinic!
    clinic = current_user.clinic
    if clinic&.status == false || !clinic
      redirect_to no_clinic_path 
    end
  end

end
