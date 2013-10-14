class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
    else
      where(conditions).first
    end
  end

  after_create { CreatedUser.create user: self, role: Role.find_by_name('user') }

### This is the correct method you override with the code above
### def self.find_for_database_authentication(warden_conditions)
### end
  validates :username,
            :uniqueness => {
                :case_sensitive => false
            } #TODO: write devise validation
              #,:format => { with: /[A-Za-z0-9:punct:]/ } # TODO: change username format.
end
