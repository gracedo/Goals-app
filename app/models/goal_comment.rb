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

class GoalComment < ActiveRecord::Base
  belongs_to :goal
  belongs_to :poster,
             :primary_key => :id,
             :foreign_key => :poster_id,
             :class_name => "User"
end