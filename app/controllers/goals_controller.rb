class GoalsController < ApplicationController
  before_action :require_signed_in, except: :public_goals

  def index
    @user = User.find(params[:user_id])
    @goals = @user.goals
    @user_comments = @user.user_comments
    render :index
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to user_goal_url(current_user, @goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find(params[:id])
    @goal_comments = @goal.goal_comments
  end

  def edit
    @goal = Goal.find(params[:id])
    @user = @goal.user
    render :edit
  end

  def update
    @goal = Goal.find(params[:id])
    @user = @goal.user

    if @goal.update_attributes(goal_params)
      redirect_to user_goals_url(@user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def completed
    @goal = Goal.find(params[:goal_id])
    @user = @goal.user
    @goal.completed = true

    if @goal.save
      redirect_to user_goals_url(@user)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def public_goals
    @goals = Goal.where(public: true).includes("user")
  end

  private

    def require_signed_in
      redirect_to new_session_url unless signed_in?
    end

    def goal_params
      params.require(:goal).permit(:name, :completed, :public)
    end
end
