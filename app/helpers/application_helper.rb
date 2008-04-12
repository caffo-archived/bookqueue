# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
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

  def show_iphone_rating(stars)
    response = '<div class="rating">'
    response << '<span style="color: gold">'

    stars.downto(1) do
      response << '&#9733;'
    end

    response << '</span>'
    response << '<span style="color: #eee">'

    (5-stars).downto(1) do
      response << '&#9733;'
    end

    response << '</span>'
    response << '</div>'
  end
  
  def show_cover(book,size)
    case size
    when "small"
      height  = "66px"
      width   = "49px"
      version = :small
    when "medium"
      height = "98px"
      width  = "74px"
     version = :medium    
    when "large"
      height = "164px"
      width  = "123px"
      version = :large
    when "original"
      height = "246px"
      width  = "184px"    
    end

    if !book.cover.nil?
  		response = image_tag book.cover.public_filename(version), {:style => "height: #{height}; width: #{width}"}
    elsif !book.image.empty?
  		response = image_tag book.image, {:style => "height: #{height}; width: #{width}"}		
    else
  		response = image_tag '/images/default_cover.gif', {:style => "height: #{height}; width: #{width}"}
    end

    return response
  end
end
