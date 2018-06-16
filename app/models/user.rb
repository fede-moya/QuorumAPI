# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  ip         :string
#  user       :string
#  email      :string
#  status     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :email, presence: true
  validates :user, uniqueness: true, presence: true
  validates :ip, uniqueness: true, presence: true
end
