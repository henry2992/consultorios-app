class Docs::ClinicsController < Docs::DoctorsController

  def show
    @clinic = current_user.clinic
  end
end
