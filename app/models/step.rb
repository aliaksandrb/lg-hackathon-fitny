class Step < ActiveRecord::Base
  belongs_to :guide
  belongs_to :layout_type

  has_attached_file :static_picture, styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :static_picture, content_type: /\Aimage\/.*\Z/
end
