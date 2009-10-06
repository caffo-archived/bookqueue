# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_rating(stars,layout)
    if layout == "iphone"
      star_tag    = image_tag 'star.png', :style => 'border: 0'
      no_star_tag = image_tag 'no_star.png', :style => 'border: 0'
    else
      star_tag    = image_tag 'bullet_star.png', :style => 'border: 0'
      no_star_tag = image_tag 'bullet_no_star.png', :style => 'border: 0'    
    end
    
    response    = '<div class="rating">'
    
        stars.downto(1) { response << star_tag    }
    (5-stars).downto(1) { response << no_star_tag }
    
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

    if book.cover?
  		response = image_tag book.cover.url(version), {:style => "height: #{height}; width: #{width}"}
    elsif book.image?
  		response = image_tag book.image, {:style => "height: #{height}; width: #{width}"}		
    else
  		response = image_tag DEFAULT_COVER, {:style => "height: #{height}; width: #{width}; border: 0px;"}
    end

    return response
  end
end
