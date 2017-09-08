class Attachment < ApplicationRecord

  belongs_to :imageable, polymorphic: true
  
  has_attached_file :image, default_url: "/images/:style/missing.png"
  has_attached_file :image, styles: { big: "1280x720", medium: "800x600", mini: "400x200", thumb: "50x50" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
