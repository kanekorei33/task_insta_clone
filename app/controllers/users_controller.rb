class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[new create]
  before_action :ensure_correct_user, only: %i[edit update]

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to pictures_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "編集しました！"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require( :user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end

