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
      redirect_to europe_path notice:'＜error＞出場国が一つも選ばれていません', africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    elsif @europe_checks.count != 14
      redirect_to europe_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    elsif params[:europe].include?('1') == false
      redirect_to europe_path notice:'＜error＞ロシアは開催国のため必ず出場させてください', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
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

    if params[:asia] == nil
      redirect_to asia_path notice:'＜error＞出場国が一つも選ばれていません', europe: params[:europe], africa: params[:africa], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    elsif @asia_checks.count != 4 and @asia_checks.count != 5
      redirect_to asia_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    end
  end

  def concacaf
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 5) - @concacaf_checks

    if params[:southamerica] == nil
      redirect_to southamerica_path notice:'＜error＞出場国が一つも選ばれていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], concacaf: params[:concacaf], oceania: params[:oceania]
    elsif @southamerica_checks.count != 4 and @southamerica_checks.count != 5
      redirect_to southamerica_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    end
  end

  def asia
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 4) - @asia_checks

    if params[:africa] == nil
      redirect_to africa_path notice:'＜error＞出場国が一つも選ばれていません', europe: params[:europe], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    elsif @africa_checks.count != 5
      redirect_to africa_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    end
  end

  def oceania
    @europe_checks = Country.where(id: params[:europe])
    @africa_checks = Country.where(id: params[:africa])
    @asia_checks = Country.where(id: params[:asia])
    @southamerica_checks = Country.where(id: params[:southamerica])
    @concacaf_checks = Country.where(id: params[:concacaf])
    @oceania_checks = Country.where(id: params[:oceania])
    @derarenai_countries = Country.where(continent_id: 6) - @oceania_checks

    if params[:concacaf] == nil
      redirect_to concacaf_path notice:'＜error＞出場国が一つも選ばれていません', europe: params[:europe], africa: params[:africa], southamerica: params[:southamerica], asia: params[:asia], oceania: params[:oceania]
    elsif @asia_checks.count + @concacaf_checks.count != 8
      redirect_to concacaf_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    end
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

    if thirtysecond.count != 32
      redirect_to oceania_path notice:'＜error＞出場国の数が規定に合っていません', europe: params[:europe], africa: params[:africa], asia: params[:asia], southamerica: params[:southamerica], concacaf: params[:concacaf], oceania: params[:oceania]
    end

    @thirtysecond = Country.where(id: thirtysecond)
  end
end
