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

    @strong = Country.order(:fifarank).find(cpluck).first
    @strong2 = Country.order(:fifarank).find(cpluck)[2]

  end

  def shuffle
    @participations = Participation.where(wcup_id: params[:id])

    pot1 = @participations.where(pot: 1)
    pot2 = @participations.where(pot: 2)
    pot3 = @participations.where(pot: 3)
    pot4 = @participations.where(pot: 4)

    pot1.shuffle.each_with_index do |p1, i|
      p1.group_id = i+1
      p1.save
    end

    pot2.shuffle.each_with_index do |p2, i|
      p2.group_id = i+1
      p2.save
    end

    pot3.shuffle.each_with_index do |p3, i|
      p3.group_id = i+1
      p3.save
    end

    pot4.shuffle.each_with_index do |p4, i|
      p4.group_id = i+1
      p4.save
    end

    ga_pluck = @participations.where(group_id: 1).pluck(:country_id)
    gb_pluck = @participations.where(group_id: 2).pluck(:country_id)
    gc_pluck = @participations.where(group_id: 3).pluck(:country_id)
    gd_pluck = @participations.where(group_id: 4).pluck(:country_id)
    ge_pluck = @participations.where(group_id: 5).pluck(:country_id)
    gf_pluck = @participations.where(group_id: 6).pluck(:country_id)
    gg_pluck = @participations.where(group_id: 7).pluck(:country_id)
    gh_pluck = @participations.where(group_id: 8).pluck(:country_id)

    groupa = Country.find(ga_pluck).pluck(:fifarank).sum
    groupb = Country.find(gb_pluck).pluck(:fifarank).sum
    groupc = Country.find(gc_pluck).pluck(:fifarank).sum
    groupd = Country.find(gd_pluck).pluck(:fifarank).sum
    groupe = Country.find(ge_pluck).pluck(:fifarank).sum
    groupf = Country.find(gf_pluck).pluck(:fifarank).sum
    groupg = Country.find(gg_pluck).pluck(:fifarank).sum
    grouph = Country.find(gh_pluck).pluck(:fifarank).sum

    sums = [groupa, groupb, groupc, groupd, groupe, groupf, groupg, grouph]

    min_sum = sums.min
    death = sums.index(min_sum) + 1

    @death = Group.find(death)
  end
end
