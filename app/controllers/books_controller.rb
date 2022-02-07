class BooksController < ApplicationController
    def create
         book = Book.new(book_params)
    # ２. データをデータベースに保存するためのsaveメソッド実行
    book.save
    # ３. トップ画面へリダイレクト
    redirect_to books_path
    end

    private
  # ストロングパラメータ
    def book_params
    params.require(:book).permit(:title, :body)
    end
end

