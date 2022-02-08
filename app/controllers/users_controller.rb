class UsersController < ApplicationController
  def index
    @book = Book.new
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

   private
  # ストロングパラメータ
    def book_params
    params.require(:book).permit(:title, :body)
    end
end
