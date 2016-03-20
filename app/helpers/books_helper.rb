module BooksHelper
  def urls(book)
    %w(pdf mobi epub).map do |type|
      content_tag :a,
        href: "#{book.url}#{type}",
        class: 'btn btn-primary download',
        data: { id: book.id } do
        content_tag :i, class: 'fa fa-cloud-download' do
          type.capitalize
        end
      end
    end.join(' ').html_safe
  end
end
