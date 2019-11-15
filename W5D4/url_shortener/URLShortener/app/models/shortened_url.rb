# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_shortened_urls_on_long_url_and_short_url  (long_url,short_url) UNIQUE
#
require 'securerandom'
class ShortenedUrl < ApplicationRecord

  validates :short_url, uniqueness: {
    scope: :long_url,
    message: "repeated url combination"
  }

  validate :valid_url?

  def self.random_code
    SecureRandom::urlsafe_base64
  end
  
  def self.create!(user, long_url)
    code = ShortenedUrl.random_code
    while ShortenedUrl.exists?(code)
      code = ShortenedUrl.random_code
    end
    ShortenedUrl.new(long_url: long_url, short_url: code, user_id: user.id)
  end



  def valid_url?
    valid_endings = ['.com', '.net', '.gov', '.org', '.io', '.ai']
    errors[:long_url] << "is invalid. wrong ending" unless valid_endings.any? {|ending| long_url.include?(ending)}
  end

  def num_clicks
    
  end


  has_one :submitter,
    primary_key: :user_id,
    foreign_key: :id,
    class_name: :User

  has_many :num_clicks,
    primary_key: :id,  
    foreign_key: :short_url_id,
    class_name: :Visit


end
