class UsersController < ApplicationController

  # render new.rhtml
  def new
    login_required if User.all.size > 0      
  end

  def create
    cookies.delete :auth_token
    reset_session
    @user = User.new(params[:user])
    @user.save!
    self.current_user = @user
    redirect_back_or_default('/')
    flash[:notice] = "Thanks for signing up!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

end
