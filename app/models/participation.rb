class Participation < ApplicationRecord
    belongs_to :wcup
    belongs_to :country
    belongs_to :group, optional: true
end
