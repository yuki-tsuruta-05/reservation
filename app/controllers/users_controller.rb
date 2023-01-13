class UsersController < ApplicationController
  
  def post
    @user = User.find(current_user.id)
    @rooms = @user.rooms
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
   
  def update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image, :name, :self_introduction))
      flash[:notice] = "「#{@user.name}」の情報を更新しました"
      flash.discard(:notice)
      redirect_to :user
    else
      render "users/edit"
    end
  end

  def user_params
    params.require(:user).permit(:image)
  end
end