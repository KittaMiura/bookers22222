class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id), notice: 'Welcome! You have signed up successfully.'
    end
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
