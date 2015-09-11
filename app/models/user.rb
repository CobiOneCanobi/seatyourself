class User < ActiveRecord::Base
  has_secure_passsword
  has_many :reservations
  has_many :restaurants, through: :reservations
  has_many :owned_restaurants, class_name: "Restaurant", foreign_key: "owner_id"
end
