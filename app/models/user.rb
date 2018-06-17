# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  ip         :string
#  user       :string
#  email      :string
#  status     :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  password   :string
#

class User < ApplicationRecord
  validates :password, presence: true
  validates :email, presence: true
  validates :user, uniqueness: true, presence: true
  validates :ip, uniqueness: true, presence: true


  def tweet(message)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "WN2FQ7v8bEsZMGx7pYWJ0Bhc5"
      config.consumer_secret     = "T7uRyp8C7sFolKWxXjQNq6XwTR0rnVmPaifN0QW1a22HNsosm4"
      config.access_token        = "1008136843030859782-VE1Gd2QYUygaDRezL77hqSQqR6zhqS"
      config.access_token_secret = "j6pI1Fzw9US1NCnREqd794Bn9qh4gl48V7tbsnSbL0bWF"
    end
    client.update(message)
  end
end
