class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :party_size, :time_slot, :presence => true
  # validates :capacity

  # def capacity
  #   total = Reservation.sum(:party_size)
  #   if total > 20
  #     errors[:base] << "Capacity for restaurant exceeded. Please try a different reservation time"
  #   end
  # end
end
