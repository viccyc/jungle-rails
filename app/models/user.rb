require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :reviews

  # def password
  #   @password ||= Password.new(password_digest)
  # end

  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_digest = @password
  # end

  before_validation :downcase_email

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence:  true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
  validates :password_confirmation, presence: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
