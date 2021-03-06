class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  before_create :create_role

  has_many :users_roles, :dependent => :destroy
  has_many :roles, :through => :users_roles

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

  def role?(role)
    return !!self.roles.find_by_name(role)
  end

  private
  def create_role
    self.roles << Role.find_by_name(:user) if ENV["RAILS_ENV"] != 'test'
  end

### This is the correct method you override with the code above
### def self.find_for_database_authentication(warden_conditions)
### end
  validates :username,
            :uniqueness => {
                :case_sensitive => false
            },
            :format => {with: /[[:word:]]/}
end
