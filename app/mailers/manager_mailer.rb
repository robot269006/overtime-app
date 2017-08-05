class ManagerMailer < ApplicationMailer

  # name of the method(here it's "email") must equal the name of the text file.
  # so in this case, the text file name must be "email.text.erb"
  def email manager
    @manager = manager
    mail(to: @manager.email, subject: 'Daily Overtime Request Email')
  end
end
