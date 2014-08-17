class VisitorsController < ApplicationController
  def new
    flash[:notice] = "Welcome"
    flash[:alert] = "Access not allowed"
  end
end
