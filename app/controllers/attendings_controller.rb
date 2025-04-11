class AttendingsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    attendance = @event.attendings.find_or_create_by(user: current_user)

    if attendance.previously_new_record?
      redirect_to event_path(@event), notice: "You are attending this event!"
    else
      redirect_to event_path(@event), alert: "you are already attending this event"
    end
  end

  
  def destroy
    @event = Event.find(params[:event_id])
    @attending = current_user.attendings.find_by(event: @event)
    
    if @attending
      @attending.destroy
      redirect_to event_path(@event), notice: "You are no longer attending this event."
    else
      redirect_to event_path(@event), alert: "Attendance record not found."
    end
  end
end