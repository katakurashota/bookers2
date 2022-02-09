class BooksController < ApplicationController
  
    def index 
     @book = Book.new
     @user = current_user
    end 
    
    def create
      @book = Book.new(book_params)
      # ２. データをデータベースに保存するためのsaveメソッド実行
      @book.user_id = current_user.id
      @book.save
      # ３. トップ画面へリダイレクト
      redirect_to book_path(@book.id)
    end

    def show
      @book = Book.find(params[:id])
      @newbook = Book.new
      @user = @book.user
    end
    
    def edit
     @book = Book.find(params[:id])
    end
    

    private
  # ストロングパラメータ
    def book_params
    params.require(:book).permit(:title, :body)
    end
end

