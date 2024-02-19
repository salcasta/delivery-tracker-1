# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  arrive_on   :date
#  description :string
#  detail      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Post < ApplicationRecord
end
