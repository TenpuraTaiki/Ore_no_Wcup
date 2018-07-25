class Group < ApplicationRecord
    has_many :participations
    has_many :countries, :through => :participations
end
