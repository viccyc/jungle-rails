class User < ActiveRecord::Base
  attr_accessor :password
  validates :first_name, presence: true
  validates :last_name, presence:  true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :password, confirmation: true #password_confirmation attr
  validates_length_of :password, in: 6..20, on: :create
end
