class UserMailer < ApplicationMailer
    default from: 'acen.fr@gmail.com'

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/login'
        mail(to: @user.email, subject: 'Bienvenue chez nous !')
    end

    
end
