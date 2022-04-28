class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  before_save :downcase_email
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 3, maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :biodiversity_reports, foreign_key: 'author_id'

  paginates_per 20
  
  def self.from_omniauth(auth, allowed_domains)
    return unless allowed_domains.include? auth&.extra&.raw_info&.hd
    where(email: auth.info.email).first_or_create do |user|
      user.password = Devise.friendly_token[0,20]
      user.email = auth.info.email
      user.name = auth.info.name
    end
  end

  def to_s
    name
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
