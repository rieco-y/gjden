class DaytimesController < ApplicationController

  def index
    @daytime = Daytime.where(date: :day)
  end
  def show
    @daytime = Daytime.find(params[:id])
  end
  def daytime_params
    params.require(:daytime).permit(:reservation_id, :user_id)

  end

end
