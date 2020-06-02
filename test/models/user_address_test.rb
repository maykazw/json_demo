# == Schema Information
#
# Table name: user_addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  street     :string
#  suite      :string
#  city       :string
#  zipcode    :string
#  geo_lat    :float
#  geo_lng    :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class UserAddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
