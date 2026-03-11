
# app/controllers/activity_items_controller.rb
class ActivityItemsController < ApplicationController
  before_action :authenticate_user!

  def check_answer
    @item = ActivityItem.find(params[:id])
    user_answer = params[:answer].to_s.strip.downcase
    correct     = @item.answer.strip.downcase

    render json: {
      correct: user_answer == correct,
      correct_answer: @item.answer
    }
  end
end