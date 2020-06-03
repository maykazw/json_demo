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
class CommentSerializer < ActiveModel::Serializer
  attributes :id, :name,:external_uuid,:body
end
