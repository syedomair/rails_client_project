class SessionsController < ApplicationController

  def signin
    rtnResponse = SampleApi::Session.new.signin(params[:email], params[:password])

    if rtnResponse && rtnResponse[:status] == 'success'
      log_in(params[:email], params[:password], params[:user_id])
    else
      flash[:signin_error] = 'Invalid email/password'
    end

    #respond_to do |format|
    #  format.js # render sessions/signin.js.erb 
    #end
    redirect_to root_path
  end

  def signup
    rtnResponse = SampleApi::Session.new.signup(params[:email], params[:password], params[:password_confirmation], params[:first_name], params[:last_name])

    if rtnResponse && rtnResponse[:status] == 'success'
      log_in(params[:email], params[:password], params[:user_id])
    else
      flash[:signup_error] = 'Invalid data'
    end

    #respond_to do |format|
    #  format.js # render sessions/signup.js.erb 
    #end
    
    redirect_to root_path
  end

  def signout
    log_out if logged_in?

    #respond_to do |format|
    #  format.js # render sessions/signout.js.erb 
    #end
    redirect_to root_path
  end


end
