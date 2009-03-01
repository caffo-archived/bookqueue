module BooksHelper
  def seo_url(book)
    "#{book_url(book)}-#{book.title.to_slug}"
  end
end