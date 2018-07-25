class ParticipationsController < ApplicationController
  def index
    participations = Participation.where(wcup_id: params[:id])
    @pot1 = participations.where(pot: 1)
    @pot2 = participations.where(pot: 2)
    @pot3 = participations.where(pot: 3)
    @pot4 = participations.where(pot: 4)

    cpluck = participations.pluck(:country_id)
    call = [*1..62]
    cnot = call-cpluck
    @zannen = Country.order(:fifarank).find(cnot).first

  end

  def shuffle
  end
end
