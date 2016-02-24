class ApplicationController < ActionController::Base
  def new
  end

  def create
    @user = User.find(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[user_id] = @user.id
      flash[:success] = 'Welcome!'
      redirect_to root_path
    else
      flash[:warning] = "You have entered incorrect email and/or password"
      render :new
    end
  end

  def destroy
    session.delete(:user)
    redirect_to root_path
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
