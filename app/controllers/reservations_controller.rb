class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
    @reservation = Reservation.all.where(day: Date.current)
    @new_reservations = Reservation.order(updated_at: :desc)
  end

  def new
    @reservation = Reservation.new(day: params[:format])
  end

  def show
    @reservation = Reservation.find(params[:id])
    @look = Look.new
  end

  def create
    @reservation = Reservation.new(reservation_parameter)
    @reservation.valid?
    start_time_set
    if @reservation.save(context: :check)
    else
      render :new
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_parameter)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.delete
  end

  def oneday
    set_date
    @reservations = Reservation.where(day: params[:id])
  end


  private

  def  reservation_parameter
    params.require(:reservation).permit(:day, :time, :end_time, :group_name, :manager, :phone_number, :people_number, :room_id, :use, :start_time).merge(user_id: current_user.id)
  end

  def start_time_set
    if @reservation.valid?
      @day = @reservation.day.strftime("%Y/%m/%d")
      @time = @reservation.time.strftime("%H:%M")
      @reservation.start_time = Time.zone.parse(@day + " " + @time)
      @end_time = @reservation.end_time + 1.hours
      @end_time = @end_time.strftime("%H:%M")
      @reservation.finish_time = Time.zone.parse(@day + " " + @end_time)
    end
  end


  def set_date
    date = params[:id]
    @date = date.to_date
    @braketime = "13:59"
    @brake = Time.zone.parse(date + " " + @braketime)
  end

end
