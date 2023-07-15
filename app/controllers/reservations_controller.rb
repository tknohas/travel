class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    if @user = current_user
      @reservations = Reservation.where(user_id: current_user.id)
    else
      redirect_to new_user_session_path
    end
  end

  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
    @user = current_user
  end

  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @user = current_user
    @days = (@reservation.check_out - @reservation.check_in).to_i
    @price = @days * @room.price * @reservation.people_number
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservations_path
    else
      render "confirm"
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :days, :people_number, :payment, :room_id, :user_id, :room_image, :price)
  end
end
