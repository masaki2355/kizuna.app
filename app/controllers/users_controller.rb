class UsersController < ApplicationController
  skip_before_action :login_required
  def index
    @user = User.all
  end

  def show
    @user = User.where(user_id: current_user.id)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: "ユーザー「#{@user.schoolname}」を登録しました"
    else
      render :new, notice: "もう一度やり直してください"
    end
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to users_user_url(@user), notice: "ユーザー「#{@user.schoolname}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = current_user.user.find_by(params[:id])
    @user.destroy
    redirect_to users_user_url, notice:"ユーザー「#{@user.schoolname}」を削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:schoolname, :email, :address, :telephonenumber, :password, :password_confirmation)
  end

end
