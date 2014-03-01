class UserCommentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @comment = @user.user_comments.new(comment_params)
    @comment.poster_id = current_user.id

    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to user_goals_url(@user)
  end

  def destroy
    @comment = UserComment.find(params[:id])
    @comment.destroy
    redirect_to user_goals_url(@comment.user)
  end

  private
  def comment_params
    params.require(:user_comment).permit(:body, :goal_id, :poster_id)
  end
end
