class UsersController < ApplicationController
  def show 
    @user = User.find(params[:id])
    @hosted_events = @user.hosted_events
    @attended_events = @user.attended_events
  end
end