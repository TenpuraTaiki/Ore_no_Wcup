class CountriesController < ApplicationController
  protect_from_forgery :except => [:europe, :africa, :southamerica, :concacaf, :asia, :oceania]

  def before
  end

  def europe
    @countries = Country.where(continent_id: 1)
    @europe_checks = Country.where(id: params[:europe])
    @derarenai_countries = @countries - @europe_checks
  end

  def africa
    @countries = Country.where(continent_id: 2)
    @europe_checks = Country.where(id: params[:europe])

    if params[:europe] == nil
      redirect_to europe_path notice:'＜error＞出場国が一つも選ばれていません', europe: params[:europe]
    elsif @europe_checks.count != 14
      redirect_to europe_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe]
    elsif params[:europe].include?('1') == false
      redirect_to europe_path notice:'＜error＞ロシアは開催国のため必ず出場させてください', europe: params[:europe]
    end

  end

  def southamerica
    @countries = Country.where(continent_id: 3)
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
  end

  def concacaf
    @countries = Country.where(continent_id: 5)
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
  end

  def asia
    @countries = Country.where(continent_id: 4)
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
  end

  def oceania
    @countries = Country.where(continent_id: 6)
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
  end

  def thirtysecond
    europe = params[:europe]
    africa = params[:africa]
    asia = params[:asia]
    southamerica = params[:southamerica]
    concacaf = params[:concacaf]
    oceania = params[:oceania]
    @europe_checks = Country.where(id: europe)
    @africa_checks = Country.where(id: africa)
    @asia_checks = Country.where(id: asia)
    @southamerica_checks = Country.where(id: southamerica)
    @concacaf_checks = Country.where(id: concacaf)

    if oceania == nil
      thirtysecond = europe + africa + asia + southamerica + concacaf
    else
      thirtysecond = europe + africa + asia + southamerica + concacaf + oceania
      @oceania_checks = Country.where(id: oceania)
    end

    @thirtysecond = Country.where(id: thirtysecond)
    @col_five = @thirtysecond.first(16)
    @col_six = @thirtysecond.last(16)
  end
end
