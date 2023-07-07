class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "登録が完了しました"
    end
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to rooms_path(@room)
  end

  private
  def room_params
    params.require(:room).permit(:title, :body, :price, :adress, :room_image, user_id)
  end
end
