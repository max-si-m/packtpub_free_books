module BooksHelper
  def urls(url)
    %w(pdf mobi epub).map do |type|
      link_to type, "#{url}#{type}"
    end.join(' ').html_safe
  end
end
