class GoalsController < ApplicationController
  before_action :require_signed_in

  def index
    render :index
  end

  private

    def require_signed_in
      redirect_to new_session_url unless signed_in?
    end
end
