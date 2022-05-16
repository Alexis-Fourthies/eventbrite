class EventMailer < ApplicationMailer
    default from: 'acen.fr@gmail.com'

    def event_email(attendance)
        @attendance = attendance
        @url = 'http://localhost:3000/login'

        mail(to: @attendance.user.email, subject: 'Vous êtes inscrit à un événement !')
end
