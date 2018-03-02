require 'bcrypt'

class User < ActiveRecord::Base
  # attr_accessor :password, :password_confirmation
  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence:  true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates :password, confirmation: true #password_confirmation attr
  # validates_length_of :password, in: 6..20, on: :create
end