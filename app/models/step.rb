class Step < ActiveRecord::Base
  belongs_to :guide
  belongs_to :layout_type
end
