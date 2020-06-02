# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  name          :string
#  external_uuid :integer
#  body          :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
end
