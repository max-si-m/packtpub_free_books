class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    AddViewToBookService.perform(@book.id)
  end

  def download
    AddDownloadToBookService.perform(params[:id]) if params[:id]
  end
end
