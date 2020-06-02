# == Schema Information
#
# Table name: comments
#
#  id            :integer          not null, primary key
#  post_id       :integer
#  name          :string
#  email         :string
#  body          :text
#  external_uuid :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :post
end
