class WcupsController < ApplicationController
  def index
  end

  def show
  end

  def top
  end

  def create
    wcup = Wcup.new

    params[:participation].each do |p|
      participation = Participation.new
      participation.wcup_id = wcup
      participation.country_id = p
      participation.save
    end

    redirect_to participations_path(wcup)
end
