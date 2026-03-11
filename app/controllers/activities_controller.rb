# app/controllers/activities_controller.rb
class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def show
    @unit     = Unit.find(params[:unit_id])
    @section  = @unit.sections.find(params[:section_id])
    @activity = @section.activities.find(params[:id])
    @items    = @activity.activity_items.order(:position)
  end
end

