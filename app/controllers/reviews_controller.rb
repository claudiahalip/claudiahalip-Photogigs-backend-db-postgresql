class ReviewsController < ApplicationController

    def index 
        reviews = Review.all 
        render json: {reviews: reviews }
    end

    def show
        review = Review.find(params[:id])
        if review 
           render json: {review: review} 
        else
            render json: "no review found"
        end
    end

    def create
        review = Review.new(review_params)
        if review.save
            render json: {review: review}
        else
            render json: {error: "Your review couldn't be added!Please try again"}
        end
    end

    private 

    def review_params
      params.require(:review).permit(:content, :user_id, :photographer_id)  
    end

end
