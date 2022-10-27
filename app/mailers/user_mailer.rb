class UserMailer < ActionMailer::Base
    default :from => "taxido.helpdesk@gmail.com"

 def registration_confirmation(user)
    @user = params[:user]
    mail(to:  @user.email, :subject => "Registration Confirmation")
 end
 end