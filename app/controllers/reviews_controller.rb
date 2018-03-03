class ReviewsController < ApplicationController
  def create
    binding.pry
    @review = Review.new(reviews_params)
    @review.user = current_user

    if @review.save
      redirect_to :back
    else
      redirect_to :product_reviews_path 
    end
  end

  private

  def reviews_params
    params.permit(
      :rating,
      :description,
      :product_id,
      :user_id
      )
  end
end
