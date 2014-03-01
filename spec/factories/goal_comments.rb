# == Schema Information
#
# Table name: goal_comments
#
#  id         :integer          not null, primary key
#  goal_id    :integer
#  body       :string(255)
#  poster_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal_comment do
  end
end
