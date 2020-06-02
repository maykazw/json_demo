# == Schema Information
#
# Table name: user_companies
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string
#  catch_phrase :string
#  bs           :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class UserCompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
