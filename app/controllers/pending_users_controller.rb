class PendingUsersController < ApplicationController

  def show
    @pending_user = PendingUser.find_by_secret(params[:secret])
    @user = User.find_by_email(@pending_user.email)

    if @user
      @pending_user.destroy
      redirect_to @user
    else
      @user = User.new
      @user.email = @pending_user.email
    end
  end
  
end
