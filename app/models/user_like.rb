class UserLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
end
