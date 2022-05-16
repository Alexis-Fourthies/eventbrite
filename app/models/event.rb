class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    belongs_to :admin, class_name: 'User'
    
    validate :start_date_cannot_be_in_the_past, :duration_must_be_multiple_of_5

    def start_date_cannot_be_in_the_past
        if start_date < Date.today
            errors.add(:start_date, "can't be in the past")
        end
    end

    def duration_must_be_multiple_of_5
        if duration % 5 != 0
            errors.add(:duration, "must be a multiple of 5")
        end
    end

    validates :duration, presence: true, numericality: { greater_than: 0 }
    validates :title, presence: true, length: { in: 5..140 }
    validates :description, presence: true, length: { in: 20..1000 }
    validates :price, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 1000 }
    validates :location, presence: true

end
