require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :reviews

  before_validation :downcase_email

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence:  true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, presence: true
  validates :password_confirmation, presence: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create

  def self.authenticate_with_credentials email, password
    email = email.strip.downcase
    @user = User.find_by_email(email)
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(password)
      return @user
    else
      return nil
    end
  end

  private

  def downcase_email
    self.email = email.downcase if email.present?
  end
end
