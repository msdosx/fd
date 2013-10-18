class Tag < ActiveRecord::Base
  has_one :base_settings, :inverse_of => :tag
  validates :name, uniqueness: true
end
