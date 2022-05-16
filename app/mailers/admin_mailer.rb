class AdminMailer < ApplicationMailer
    default from: 'acen.fr@gmail.com'

    def new_attendee(attendance)
        @attendance = attendance
        @attendance_user = User.find(@attendance.user_id)
        @attendance_event = @attendance.event
        @admin = User.find(@attendance_event.admin_id)
        @url = 'http://localhost:3000/login'
        mail(to: @admin.email, subject: 'Nouvelle inscription à votre événement !')
    end

end
