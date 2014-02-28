class SessionsController < ApplicationController
  before_filter :redirect_if_signed_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username],
                                     params[:user][:password])

    if @user
      sign_in(@user)
      redirect_to goals_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :session_token)
    end
end
