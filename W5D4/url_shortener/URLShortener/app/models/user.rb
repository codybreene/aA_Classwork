# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validate :invalid_email?

  def invalid_email?
    if !email.nil?
      array = email.split("@")
      errors[:email] << 'not valid (no @)' if array.length != 2
      if !array[1].nil?
        second = array[1].split(".")
        errors[:email] << "not valid (No Period)" if second.length != 2
      end
    end
  end


  has_many :submitted_urls,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ShortenedUrl
end
