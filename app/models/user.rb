class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :phone
  has_many :posts

  # PHONE_REGEX is the regular expression matcher, and :phone format is checked with this matcher
  PHONE_REGEX = /\A[0-9]*\Z/
  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 10 }

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
