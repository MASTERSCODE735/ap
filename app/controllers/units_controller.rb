# app/controllers/units_controller.rb
class UnitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @units = Unit.order(:position)
  end

  def show
    @unit = Unit.includes(sections: [:phrases, activities: :activity_items])
                .first
    @sections = @unit.sections.order(:position)
  end
end