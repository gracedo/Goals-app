class GoalCommentsController < ApplicationController
  def create
    @goal = Goal.find(params[:goal_id])
    @comment = @goal.goal_comments.new(comment_params)
    @comment.poster_id = current_user.id

    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to user_goal_url(@goal.user, @goal)
  end

  def destroy
    @comment = GoalComment.find(params[:id])
    @comment.destroy
    redirect_to user_goal_url(@comment.goal.user, @comment.goal)
  end

  private
  def comment_params
    params.require(:goal_comment).permit(:body, :goal_id, :poster_id)
  end
end
