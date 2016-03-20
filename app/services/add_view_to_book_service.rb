class AddViewToBookService < Aldous::Service
  attr_reader :book

  def initialize(book_id)
    @book = Book.find(book_id)
  end

  def perform
    if @book.increment!(:views, 1)
      Result::Success.new(book: book)
    else
      Result::Failure.new
    end
  end
end
