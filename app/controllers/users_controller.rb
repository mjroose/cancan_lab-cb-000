class UsersController < ApplicationController
  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to notes_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end
