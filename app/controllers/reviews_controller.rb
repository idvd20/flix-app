class ReviewsController < ApplicationController
    
    before_action :require_signin
    before_action :write_review

    def index  
        @reviews = @movie.reviews
    end

    def new
        @review = @movie.reviews.new
    end

    def create
        @review = @movie.reviews.new(movie_params)
        @review.user = current_user

        if @review.save
            redirect_to @movie, notice: "Thanks for your review!"
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

        def movie_params
            params.require(:review).permit(:comment, :stars)
        end

        def write_review
            @movie = Movie.find(params[:movie_id])
        end
end
