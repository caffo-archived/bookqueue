module BooksHelper

def show_rating(stars)
  response = '<div class="rating">'
  response << '<span style="color: #76614e">'
  
  stars.downto(1) do
    response << '&#9733;'
  end
  
  response << '</span>'
  response << '<span style="color: #d0c3a1">'
  
  (5-stars).downto(1) do
    response << '&#9733;'
  end

  response << '</span>'
  response << '</div>'
end

end