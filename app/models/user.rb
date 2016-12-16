class User < ApplicationRecord
  has_secure_password
  
  ##============================================================##
  ## Validation
  ##============================================================##  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  ##============================================================##
  ## Callbacks
  ##============================================================##
  before_save   :downcase_email
end
