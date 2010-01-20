module BooksHelper
  def seo_url(book)
    "#{book_url(book)}-#{book.title.to_slug}"
  end

  def pages_graphic(report,div)
    data     = ""
    labels   = ""
    colors   = "968160,"

    report.each do |i|
      data   << " [0, #{i[:pages]}]"
      data   << "," unless i == report.last

      colors << "'968160'"
      colors << "," unless i == report.last

      labels << " '"
      labels << "#{i[:month].strftime('%b/%y')}"
      labels << "'"
      labels << "," unless i == report.last
    end

    response = "<script type='text/javascript' charset='utf-8'>
    $(function () {
      var api = new jGCharts.Api();
      var opt = {
      data : [#{data}],
      axis_labels : [#{labels}],
      colors : [#{colors}],
      bg   : 'E3D9BD',
      bar_width   : 18,
      size : '600x150',
      bar_spacing : 3,
      bg_type     : 'stripes',
      bg_angle    : 90,
      bg_offset   : 'dfd2b1',
      bg_width    : 20,
      }
      jQuery('<img>')
      .attr('src', api.make(opt))
      .appendTo('##{div}');
    });
    </script>"
    response.gsub("FFCC00","968160")
  end
end
