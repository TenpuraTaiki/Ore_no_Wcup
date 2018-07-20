class CountriesController < ApplicationController
  protect_from_forgery :except => [:europe, :africa, :southamerica, :concacaf, :asia, :oceania]

  def before
  end

  def europe
    @countries = Country.where(continent_id: 1)
  end

  def africa
    @countries = Country.where(continent_id: 2)
    @europe_checks = Country.where(id: params[:europe])
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
    thirtysecond = europe + africa + asia + southamerica + concacaf + oceania
    @thirtysecond = Country.where(id: thirtysecond)
    @col_one = @thirtysecond.first(8)
    @col_two = @thirtysecond.first(16).last(8)
    @col_three = @thirtysecond.last(16).first(8)
    @col_four =@thirtysecond.last(8)
    @col_five = @thirtysecond.first(16)
    @col_six = @thirtysecond.last(16)
  end
end
