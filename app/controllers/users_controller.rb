class UsersController < ApplicationController
  def index
    @book = Book.new
  end

   private
  # ストロングパラメータ
    def book_params
    params.require(:book).permit(:title, :body)
    end
end
