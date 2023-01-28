class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :cart_items

  before_validation :downcase_email

  enum role: [:user, :admin]

  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }

  validates :password, presence: true, length: { minimum: 8 }, if: :new_record?
  validates :name, length: { maximum: 100 }
  validates :confirmation_token, presence: true, uniqueness: { case_sensitive: true }

  private

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.hex
  end

  def downcase_email
    email.downcase! if email
  end

end