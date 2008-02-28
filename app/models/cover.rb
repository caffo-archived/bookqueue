class Cover < ActiveRecord::Base
  has_attachment  :content_type => :image, 
                  :storage => :file_system, 
                  :max_size => 900.kilobytes
  belongs_to :book
end
