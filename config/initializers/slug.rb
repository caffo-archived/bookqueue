require 'iconv'

class String
  def to_slug
    response = self.gsub(/[^\x20-\x7f]/){ Iconv.iconv('us-ascii//IGNORE//TRANSLIT', 'utf-8',$&)[0].sub(/^[\^`'"~](?=[a-z])/i, '')}
    returning response.downcase.gsub(/'/, '').gsub(/[^a-z0-9]+/, '-') do |slug|
      slug.chop! if slug.last == '-'
    end
  end
end
