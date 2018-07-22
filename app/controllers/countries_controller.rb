class CountriesController < ApplicationController
  protect_from_forgery :except => [:europe, :africa, :southamerica, :concacaf, :asia, :oceania]
  # これ書いてないとpostしたときにエラーがでる

  def before
  end

  def europe
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 1) - @europe_checks
  end

  def africa
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 2) - @africa_checks

    if params[:europe] == nil
      redirect_to europe_path notice:'＜error＞出場国が一つも選ばれていません', europe: params[:europe]
    elsif @europe_checks.count != 14
      redirect_to europe_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe]
    elsif params[:europe].include?('1') == false
      redirect_to europe_path notice:'＜error＞ロシアは開催国のため必ず出場させてください', europe: params[:europe]
    end

  end

  def southamerica
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 3) - @southamerica_checks
  end

  def concacaf
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 5) - @concacaf_checks
  end

  def asia
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 4) - @asia_checks
  end

  def oceania
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 6) - @oceania_checks
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
  end
end
