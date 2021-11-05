class LooksController < ApplicationController


  def create
    @look = current_user.looks.create(reservation_id: params[:reservation_id])
    @reservation = @look.reservation
  end

  def destroy
    @look = Look.find_by(reservation_id: params[:reservation_id], user_id: current_user.id)
    @reservation = @look.reservation
    @look.destroy
  end

end
