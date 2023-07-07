class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
    #@reservations = Reservation.all.includes(:room)
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:room_id])
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
    #@room = Room.find(params[:room_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "予約が完了しました"
    end
      redirect_to reservations_path
  end

  def show
    @reservation = Reservation.find_by(params[:id])
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :days, :people_number, :payment, :room_id, :user_id, :room_image)
  end
end
