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

require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
