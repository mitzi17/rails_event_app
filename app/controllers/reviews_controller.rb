class ReviewsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_review, only: [:edit, :update, :destroy]

    def index
        @event = Event.find_by_id(params[:event_id])
        if @event
            @reviews = @event.reviews
        else
            @reviews = current_user.reviews
        end
        
        
        sort_options
    end

    def show
        
        @review = Review.find(params[:id])
        
    end

    def new
        @event = current_user.events.find_by_id(params[:event_id])
        if @event
            @review = @event.reviews.build
        else
            @review = Review.new
        end
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

    def sort_options
        if params[:sort] == "updated_at"
            @reviews = Review.all.most_recent
        else
            @reviews = current_user.reviews
        end
    end


end
