class CountriesController < ApplicationController
  def before
  end

  def europe
    # @countries = Country.all
    @countries = Country.where(continent_id: 1)
  end

  def africa
  end

  def southamerica
  end

  def concacaf
  end

  def asia
  end

  def oceania
  end

  def thirtysecond
  end
end
