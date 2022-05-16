class Attendance < ApplicationRecord
    after_create :event_send

    def event_send
        UserMailer.event_email(self).deliver_now
    end

    belongs_to :user
    belongs_to :event
end
