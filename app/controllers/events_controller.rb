class EventsController < ApplicationController
    
    before_action :authenticate_user!
    before_action :set_event, only: [:edit, :update, :destroy]

    def index
        if @events = Event.search(params[:search])
            
        else
            @events = Event.all
            filter_options
        
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    
    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)
        if @event.save
            redirect_to event_path(@event)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @event.update(event_params)
            redirect_to event_path(@event)
        else
            render :edit
        end
    end

    def destroy
        @event.destroy
        redirect_to events_path
    end

    private

    def set_event
        @event = current_user.events.find(params[:id])
    end

    def event_params
        params.required(:event).permit(:name, :category, :location, :price, :date, :search)
    end

    #goes in model
    def filter_options
        if params[:filter_by_date] == "upcoming"
            @events = Event.all.upcoming
        elsif params[:filter_by_date] == "past_event"
            @events = Event.all.past_event
        elsif params[:filter_by_date] == "my_events"
            @events = current_user.events
        else
            @events = Event.all
        end
        if params[:sort] == "order_by_lowest_price"
            @events = @events.order_by_lowest_price
        elsif params[:sort] == "order_by_highest_price"
            @events = @events.order_by_highest_price
        end
    end
    
end
