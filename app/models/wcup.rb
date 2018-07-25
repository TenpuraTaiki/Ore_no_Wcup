class Wcup < ApplicationRecord
    has_many :favorites
    has_many :participations
    has_many :countries, :through => :participations
    has_many :groups, :through => :participations
end
