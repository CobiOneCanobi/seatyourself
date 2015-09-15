class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, :time_slot, :presence => true
  validate :capacity

  def capacity
    existing_reservations = Reservation.where("restaurant_id = ? and time_slot > ? and time_slot < ?", restaurant.id, time_slot - 60.minutes, time_slot + 60.minutes )
    total_people = existing_reservations.sum(:party_size)
    if (self.party_size + total_people) > 20
      errors[:base] << "Capacity for restaurant exceeded. Please try a different reservation time"
    end
  end
end
