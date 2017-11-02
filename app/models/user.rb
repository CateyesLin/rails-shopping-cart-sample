class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :receivers

  before_save :ensure_access_token

  def is_admin?
    100 <= self.role
  end

  def ensure_access_token
    self.access_token ||= generate_access_token
  end

  def generate_access_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(access_token: token).first
    end
  end

  def as_sign_in_json
    self.as_json(
      only: [:id, :email, :name, :role, :access_token]
    )
  end
end
