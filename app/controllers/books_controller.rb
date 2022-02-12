class BooksController < ApplicationController

    def index
     @book = Book.new
     @user = current_user
     @books = Book.all
    end

    def create
      @book = Book.new(book_params)
      # ２. データをデータベースに保存するためのsaveメソッド実行
      @book.user_id = current_user.id
      if @book.save
      # ３. トップ画面へリダイレクト
       redirect_to book_path(@book.id)
       flash[:notice] = "You have created book successfully." 
      else
       @user = current_user
       @books = Book.all
       render :index
      end
    end

    def show
      @book = Book.find(params[:id])
      @newbook = Book.new
      @user = @book.user
    end

    def edit
     @book = Book.find(params[:id])
    end

     def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
     end

     def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "You have updated book successfully." 

      else
        render :edit
      end
      
     end


    private
  # ストロングパラメータ
    def book_params
    params.require(:book).permit(:title, :body)
    end

    def user_params
    params.require(:user).permit(:name, :opinion)
    end

end

