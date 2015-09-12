class UsersController < ApplicationController
  def new
    if current_user
      redirect_to restaurants_path
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
     # if params[:owner] = 0
     #   @user[:owner] = true
     # elsif params[:owner] = 1
     #  @user[:owner] = false
     # end
    if @user.save
      redirect_to restaurants_path, notice: "Signed up!"
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_num)
  end
end
