class Opinion < ActiveRecord::Base
  belongs_to :tag
  #accepts_nested_attributes_for :tag
  validates :nickname, uniqueness: true

end
