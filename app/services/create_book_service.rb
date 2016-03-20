class CreateBookService < Aldous::Service
  attr_reader :book

  def initialize(book)
    @book = book
  end

  def perform
    if book.save
      Result::Success.new(book: book)
    else
      Result::Failure.new
    end
  end
end
