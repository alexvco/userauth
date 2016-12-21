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
  before_create   { generate_token(:auth_token) }

  def downcase_email
    self.email = email.downcase
  end

  # this method accepts a column name so we can have multiple token columns later on and makes sure 
  # that the token is unique by making sure no other user has that same token, 
  # if another user with that same token does exist then it goes through that loop again generating a new randon string.
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def send_activation_token
    generate_token(:activation_token)
    save!
    UserMailer.account_activation(self).deliver
  end

  def is_activated?
    self.is_activated
  end

end
