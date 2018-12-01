class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(session_params)
      session[:user_id] = @user.id
      redirect_to notes_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end

  private
    def session_params
      params.require(:user).permit(:name)
    end
end
