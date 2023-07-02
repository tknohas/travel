class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    @name = current_user.username
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
  end

  def new
    @room = Room.find_by(params[:room_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "予約が完了しました"
    end
      redirect_to reservations_path
  end

  def show
    @reservation = Reservation.find_by(params[:reservation_id])
    end
  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :days, :people_number, :payment)
  end
end
