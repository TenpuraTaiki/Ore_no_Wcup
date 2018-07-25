class Country < ApplicationRecord
    has_many :participations
    has_many :wcups, :through => :participations
    has_many :groups, :through => :participations
    belongs_to :continent
end
