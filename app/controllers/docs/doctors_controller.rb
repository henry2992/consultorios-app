class Docs::DoctorsController < ApplicationController
  before_filter :authenticate_user!
end
