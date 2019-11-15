# == Schema Information
#
# Table name: visits
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  short_url_id :integer          not null
#  user_id      :integer          not null
#
# Indexes
#
#  index_visits_on_short_url_id  (short_url_id)
#

class Visit < ApplicationRecord

  validates :short_url_id, presence: true
  validates :user_id, presence: true

  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user.id, short_url_id: shortened_url.id)
  end


end
