class UsersController < ApplicationController
  def index
     @users = User.all
     @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      flash[:notice] = "You have updated user successfully"
    # 前はredirect_to user_path(@user.id)
      redirect_to user_path(@user[:id])
    else
      render "edit"
    end
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
