class User < ActiveRecord::Base
  has_secure_password
  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :owned_restaurants, class_name: "Restaurant", foreign_key: "owner_id"

  validates :first_name, :last_name, :password_digest, :email, :phone_num, :presence => true
end
