class LooksController < ApplicationController
  #before_action :reservation_params


  def create
    @look = current_user.looks.create(reservation_id: params[:reservation_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @look = Look.find_by(reservation_id: params[:reservation_id], user_id: current_user.id)
    @look.destroy
    redirect_back(fallback_location: root_path)
  end

  #private

  #def reservation_params
    #@reserv = Reservation.find(params[:id])
  #end

end
