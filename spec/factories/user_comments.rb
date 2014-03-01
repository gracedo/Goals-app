# == Schema Information
#
# Table name: user_comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  body       :string(255)
#  poster_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_comment do
  end
end
