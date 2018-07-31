class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :wcup

    validates :comment,    length: { in: 1..300 }  
end
