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
class UserCompany < ApplicationRecord
  belongs_to :user
end
