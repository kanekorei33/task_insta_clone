class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  
  def index
    @users = User.all
  end

  def
     new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
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

  def confirm
    @user = current_user.users.build(user_params)
    render :new if @user.invalid?
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end

  end

  private
  
  def user_params
    params.require( :user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end

