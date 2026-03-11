# app/controllers/phrases_controller.rb
class PhrasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_section

  def index
    @phrases = @section.phrases.order(:position)
  end

  def audio
    @phrase = @section.phrases.find(params[:id])

    if @phrase.audio.attached?
      redirect_to rails_blob_url(@phrase.audio, disposition: "inline")
    else
      render json: { error: "Audio not available" }, status: :not_found
    end
  end

  private

  def set_section
    @unit    = Unit.find(params[:unit_id])
    @section = @unit.sections.find(params[:section_id])
  end
end