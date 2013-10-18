class BaseSettings < ActiveRecord::Base
  belongs_to :tag, :inverse_of => :base_settings, :dependent => :destroy
  validates :post_keep_days_delta, numericality: { only_integer: true }
end
