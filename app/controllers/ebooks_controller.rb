class EbooksController < ApplicationController
  def index
    if params[:ebooks]
      @ebooks = Ebook.where('title LIKE ?', "%#{params[:ebooks]}%").or(Ebook.where('author LIKE ?', "%#{params[:ebooks]}%"))
  else
    @ebooks = Ebook.all
  end
  end

  def new
    @ebook = Ebook.new
  end

  def create
    @ebook = Ebook.new(ebook_params)
      if @ebook.save
        redirect_to fallback_location: root_path
      else
        f.html {redirect_to "", notice: "Error: Ebook not saved"}
      end
  end

  private
  def ebook_params
    params.require(:ebook).permit(:title, :author, :description)
  end
end
