class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :comments, through: :posts
  has_one_attached :image


  attr_accessor :remember_token

  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 60 },
                    format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }


  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # return hash digest of string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # return random token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remember user in DB to use in persisted sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # true if Oauth token match digest
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forget a user
  def forget
    update_attribute(:remember_digest, nil)
  end

end #/> class
