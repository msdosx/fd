class Opinion < ActiveRecord::Base
  belongs_to :tag
  validates :nickname, uniqueness: true

end
