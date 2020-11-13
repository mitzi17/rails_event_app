class EventsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
        @events = current_user.events
    end

    def show
        
    end
    
    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_event
        @event = current_user.events.find(params[:id])
    end
end
