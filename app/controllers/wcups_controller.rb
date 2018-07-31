class WcupsController < ApplicationController
  protect_from_forgery :except => [:create]
  def index
    @wcups = Favorite.page(params[:page]).reverse_order
  end

  def show
    @favorite = Favorite.find(params[:id])
    @participations = Participation.where(wcup_id: @favorite.wcup_id)
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

  # ここからポット分け
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

  # ここからグループ分け
    @participations = Participation.where(wcup_id: wcup)

    pot_1 = @participations.where(pot: 1)
    pot_2 = @participations.where(pot: 2)
    pot_3 = @participations.where(pot: 3)
    pot_4 = @participations.where(pot: 4)

    pot_1.shuffle.each_with_index do |p1, i|
      p1.group_id = i+1
      p1.save
    end

    pot_2.shuffle.each_with_index do |p2, i|
      p2.group_id = i+1
      p2.save
    end
    
    pot_3.shuffle.each_with_index do |p3, i|
      p3.group_id = i+1
      p3.save
    end

    pot_4.shuffle.each_with_index do |p4, i|
      p4.group_id = i+1
      p4.save
    end

  # 本当は同大陸どうしは同じグループに入って欲しくないので条件つけて抽選をループさせたい

  # 改善案
  # 今回のようにPOTをシャッフルしてgroupidを割り当てるのではなく、groupAという変数を作って
  # そこにPOT毎に一つずつランダムなparticipationを放り込む
  # そして4つ入った時点で大陸チェックを行い、問題なければsaveする
  # 続いてgroupBは@participationsでgroup_idがnilのものからピックする（以下groupH）まで同様
  # というふうにしたら比較的楽そう

    redirect_to participations_path(wcup)
  end
end
