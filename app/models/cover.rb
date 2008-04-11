class Cover < ActiveRecord::Base
  has_attachment  :content_type => :image, 
                  :storage      => :file_system, 
                  :max_size     => 900.kilobytes,
                  :processor    => :Rmagick,
                  :resize_to => '184x246>',
                  :thumbnails => { :large => '123x164>', :medium => '74x98>', :small => '49x66>' }
  belongs_to :book
end
