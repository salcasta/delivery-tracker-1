# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  arrive_on   :date
#  arrived     :boolean          default(FALSE)
#  description :string
#  detail      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Post < ApplicationRecord
  validates(:description, presence: true)
  validates(:arrive_on, presence: true)
end
