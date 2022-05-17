class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create

    @event = Event.new(params_event)
    @event.admin_id = current_user.id

    if @event.save
      redirect_to events_path(@event.id)
      flash[:success] = "Votre événement a bien été créé !"
    else
      render new_event_path
    end

  end

  def show
    @event = Event.find(params[:id])
    @count = count
    @end_date = end_date
  end

  private
  def params_event
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end

  def count
    Event.find(params[:id]).users.all.count
  end

  def end_date
    minutes = Event.find(params[:id]).duration*60
    (Event.find(params[:id]).start_date + minutes).strftime('%d of %B, %Y - %HH%M')
  end

end
