class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

   private
  # ストロングパラメータ
    def book_params
    params.require(:book).permit(:title, :body)
    end

    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
