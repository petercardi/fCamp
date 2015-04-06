class UsersController < ApplicationController
  helper_method :fnln

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "User was successfully created"
    else
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path, notice: "User was successfully updated"
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, notice: "User was successfully deleted"
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :likes, :dislikes, :password)
    end

end
