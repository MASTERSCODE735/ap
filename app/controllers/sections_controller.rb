# app/controllers/sections_controller.rb
class SectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_unit

  def show
    @section = @unit.sections.find(params[:id])
    @phrases = @section.phrases.order(:position)
    @activities = @section.activities.order(:position)

    render "sections/types/#{@section.section_type}"
  end

  private

  def set_unit
    @unit = Unit.find(params[:unit_id])
  end
end