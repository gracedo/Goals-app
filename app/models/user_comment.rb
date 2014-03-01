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

class UserComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :poster,
             :primary_key => :id,
             :foreign_key => :poster_id,
             :class_name => "User"
end
