class EventsController < ApplicationController
  
  def index
    # @events = Event.all
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def new 
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      redirect_to user_path(current_user), notice: "Event created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = current_user.hosted_events.find(params[:id])
  end

  def update 
    @event = current_user.hosted_events.find(params[:id])

    if @event.update(event_params)
      redirect_to user_path(current_user), notice: "Event edited successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to user_path(current_user), status: :see_other, notice: "Event successfully deleted."
    else
      redirect_to user_path(current_user), alert: "You are not authorized to delete this event."
    end
  end

  private

  def event_params
    params.expect(event: [ :date, :location, :name, :description ])
  end
end