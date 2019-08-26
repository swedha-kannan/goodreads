class UserEbooksController < ApplicationController
  def index
    @user_ebooks = UserEbook.where(:user_id => current_user)
  end

  def create
   #current_user = User.find_by(:id => params[:user_id])
    book = Book.find_by(:id => params[:id])
    current_user.add_to_shelf(book)
    redirect_back fallback_location: root_path
  end

  def update
    book = Ebook.find_by(:id => params[:id])
    current_user.add_to_shelf(book)
    redirect_back fallback_location: root_path
  end

  def destroy
    #current_user = User.find_by(:id => params[:user_id])
    ebook_id = UserEbook.where(:id => params[:id]).first.ebook_id
    book = Ebook.find_by(:id => ebook_id)
    current_user.remove_from_shelf(book)
    redirect_back fallback_location: root_path
  end
end
