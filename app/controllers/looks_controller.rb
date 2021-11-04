class LooksController < ApplicationController
  before_action :reservation_params


  def create
    @look = current_user.looks.create(reservation_id: params[:reservation_id])
  end

  def destroy
    @look = Look.find_by(reservation_id: params[:reservation_id], user_id: current_user.id)
    @look.destroy
  end

  private

  def reservation_params
    @reserv = Reservation.find(params[:id])
  end

end
