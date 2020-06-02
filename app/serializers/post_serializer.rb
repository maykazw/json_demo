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
class PostSerializer < ActiveModel::Serializer
  attributes :id
end
