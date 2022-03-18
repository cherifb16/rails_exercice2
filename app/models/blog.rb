# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {in: 1..140}
end
