class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'shaydev@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  def welcome(user)
    @appname = "Bike Berlin"
    mail(to: user.email,
      subject: "Welcome to #{@appname}!")
  end

  def order_placed (user)
      mail(from: user.email,
           to: 'shaydev@gmail.com',
           subject: "An item has been ordered")
  end



end
