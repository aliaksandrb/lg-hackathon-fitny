class Guide < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :steps

  has_attached_file :background, styles: { medium: "610x450>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :background, content_type: /\Aimage\/.*\Z/
end
