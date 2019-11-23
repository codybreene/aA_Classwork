class CatRentalRequest < ApplicationRecord
  STATUS = ['PENDING', 'APPROVED', 'DENIED']

  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: STATUS, message: "not a valid status"}

  belongs_to :cat 

end
