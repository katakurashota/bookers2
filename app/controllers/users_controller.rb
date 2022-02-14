class UsersController < ApplicationController
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end
  
 

  def edit
    @user = User.find(params[:id])
    if current_user != @user
    redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
   if  @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully." 
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
    params.require(:user).permit(:name, :introduction, :profile_image)
    end

end
