class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
     if @user.save
      redirect_to books_path, notice: 'Welcome! You have signed up successfully.'
    end
  end


  def show
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to books_path, notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def index
    @users = User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image,:body)
  end

end
