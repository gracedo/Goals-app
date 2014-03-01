# == Schema Information
#
# Table name: goals
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  public     :boolean          default(TRUE), not null
#  user_id    :integer          not null
#  completed  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

class Goal < ActiveRecord::Base
  validates :name, :user_id, presence: true
  validates :completed, :public, inclusion: { in: [true, false] }

  belongs_to :user,
             :primary_key => :id,
             :foreign_key => :user_id,
             :class_name => "User"

  has_many :goal_comments

  private

end
