class UserMailer < ActionMailer::Base
  
  def forgot_password(user, key)
    host = Hobo::Controller.request_host
    app_name = Hobo::Controller.app_name || host
    @subject    = "#{app_name} -- forgotten password"
    @body       = { :user => user, :key => key, :host => host, :app_name => app_name }
    @recipients = user.email_address
    @from       = "todolist@neevtech.com"
    @sent_on    = Time.now
    @headers    = {}
  end
  
  def activation(user, key)
    host = Hobo::Controller.request_host
    app_name = Hobo::Controller.app_name || host
    @subject    = "#{app_name} -- activate"
    @body       = { :user => user, :key => key, :host => host, :app_name => app_name }
    @recipients = user.email_address
    @from       = "todolist@example.com"
    @sent_on    = Time.now
    @headers    = {}
  end
 


end
