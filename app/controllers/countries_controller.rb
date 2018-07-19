class CountriesController < ApplicationController
  protect_from_forgery :except => [:europe, :africa, :southamerica, :concacaf, :asia, :oceania]

  def before
  end

  def europe
    @countries = Country.where(continent_id: 1)
    # @europe = Participation.new
  end

  def africa
    @countries = Country.where(continent_id: 2)
    @europe = params[:europe]
  end

  def southamerica
    @countries = Country.where(continent_id: 3)
  end

  def concacaf
    @countries = Country.where(continent_id: 5)
  end

  def asia
    @countries = Country.where(continent_id: 4)
  end

  def oceania
    @countries = Country.where(continent_id: 6)
  end

  def thirtysecond
  end
end
