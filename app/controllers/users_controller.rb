class UsersController < ApplicationController

  def show
    rtnResponse = SampleApi::User.new.getUser(params[:id])
    if rtnResponse[:status] == 'success'
      @user = rtnResponse[:data]
    end
  end

  def update
    rtnResponse = SampleApi::User.new.updateUser(params[:id], params[:first_name], params[:last_name])
    if rtnResponse[:status] == 'success'
      @user = rtnResponse[:data]
    end
    redirect_to root_path
  end

end
