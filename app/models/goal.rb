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
end
