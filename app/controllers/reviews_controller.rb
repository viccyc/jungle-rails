class ReviewsController < ApplicationController
  before_action :require_login

  def create
    @review = Review.create(reviews_params)
    redirect_to :back
  end

  def destroy
    Review.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def reviews_params
    params.require(:review).permit(:product_id, :user_id, :description, :rating)
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_login_url # halts request cycle
    end
  end

  # The logged_in? method simply returns true if the user is logged
  # in and false otherwise. It does this by "booleanizing" the
  # current_user method we created previously using a double ! operator.
  # Note that this is not common in Ruby and is discouraged unless you
  # really mean to convert something into true or false.
  def logged_in?
    !!current_user
  end
end
