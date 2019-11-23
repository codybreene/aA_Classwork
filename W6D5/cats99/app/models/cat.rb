require 'date'

class Cat < ApplicationRecord

  COLORS = ['brown', 'grey', 'white', 'black', 'tiger-striped']

  validates :color, inclusion: {in: COLORS, message: "That's not a valid color"}
  validates :sex, inclusion: {in: %w(M F), message: "%{value} is not a valid gender"}
  validates :birth_date, :color, :sex, :name, :description, presence: true

  def age
    Date.today.year - self.birth_date.year
  end

  has_many :cat_rental_requests, dependent: destroy
  
end
