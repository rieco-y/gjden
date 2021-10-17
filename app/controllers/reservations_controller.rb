class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_parameter)
    @reservation.save
    binding.pry
    @day = params[:day]
    @time = params[:time]
    #@start_time = DateTime.parse(@day + " " + @time + " " + "JST")
    redirect_to root_path
  end


  private

  def  reservation_parameter
    params.require(:reservation).permit(:day, :time, :end_time, :group_name, :manager, :phone_number, :people_number, :room_id, :use, :start_time).merge(user_id: current_user.id)
  end

end
