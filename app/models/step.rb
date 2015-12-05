class Step < ActiveRecord::Base
  belongs_to :guide
  belongs_to :layout_type

  has_attached_file :static_picture, styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :static_picture, content_type: /\Aimage\/.*\Z/

  has_attached_file :video, styles: {
       :medium => {
          :geometry => "640x480",
          :format => 'mp4'
        },
        :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
  validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
end
