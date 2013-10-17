class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy, inverse_of: :post
end
