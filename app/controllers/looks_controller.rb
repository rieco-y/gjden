class LooksController < ApplicationController

  def create
    @look = current_user.looks.create(reservation_id: params[:reservation_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @look = Look.find_by(reservation_id: params[:reservation_id], user_id: current_user.id)
    @look.destroy
    redirect_back(fallback_location: root_path)
  end


end
