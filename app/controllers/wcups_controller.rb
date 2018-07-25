class WcupsController < ApplicationController
  protect_from_forgery :except => [:create]
  def index
  end

  def show
  end

  def top
  end

  def create
    wcup = Wcup.create

    params[:participation].each do |cid|
      participation = wcup.participations.build
      participation.country_id = cid
      participation.save!
    end

    russia = Participation.where(wcup_id: wcup.id).find_by(country_id: 1)
    russia.pot = 1
    russia.save

    participations = Participation.where(wcup_id: wcup.id).where.not(country_id: 1)

    pot1 = participations.first(7)
    pot2 = participations.first(15).last(8)
    pot3 = participations.last(16).first(8)
    pot4 = participations.last(8)

    pot1.each do |p1|
      p1.pot = 1
      p1.save
    end

    pot2.each do |p2|
      p2.pot = 2
      p2.save
    end

    pot3.each do |p3|
      p3.pot = 3
      p3.save
    end

    pot4.each do |p4|
      p4.pot = 4
      p4.save
    end

    redirect_to participations_path(wcup)
  end
end
