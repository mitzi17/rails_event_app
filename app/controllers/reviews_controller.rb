class ReviewsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        @reviews = current_user.reviews
    end

    def show
    end

    def new
        @review = Review.new
    end

    def create
        @review = current_user.reviews.build(review_params)
        if @review.save
            redirect_to review_path(@review)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to review_path(@review)
        else
            render :edit
        end
    end

    def destroy
        @review.destroy
        redirect_to reviews_path
    end

    private

    def set_review
        @review = current_user.reviews.find(params[:id])
    end

    def review_params
        params.required(:review).permit(:title, :content, :user_id, :event_id)
    end


end
