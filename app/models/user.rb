# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :username, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :username, uniqueness: true
  before_validation :ensure_session_token
  attr_reader :password

  has_many :goals,
           :primary_key => :id,
           :foreign_key => :user_id,
           :class_name => "Goal"

  has_many :user_comments,
           :primary_key => :id,
           :foreign_key => :user_id,
           :class_name => "UserComment"

  has_many :posted_user_comments,
           :primary_key => :id,
           :foreign_key => :poster_id,
           :class_name => "UserComment"

  has_many :posted_goal_comments,
           :primary_key => :id,
           :foreign_key => :poster_id,
           :class_name => "GoalComment"

  def self.generate_session_token
    SecureRandom.urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    if user.is_password?(password)
      return user
    end

    nil
  end

  private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end
