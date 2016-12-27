class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  
  has_many :favorite_courts, through: :favorites, source: :court
  
  before_save {self.email = email.downcase if email.present?}
  
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  
end
