module SessionsHelper

  def log_in(user_email, user_password)
    session[:user_email] = user_email
    session[:user_password] = user_password
  end

  def current_user
    if @current_user.nil?
      rtnResponse = SampleApi::Session.new.signin(session[:user_email], session[:user_password])
      if rtnResponse[:status] == 'success'
        @current_user = rtnResponse[:data]
      else
        return nil
      end
    else
      @current_user
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_email)
    session.delete(:user_password)
    @current_user = nil
  end
end
