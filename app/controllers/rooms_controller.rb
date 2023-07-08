class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @user = current_user
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "登録が完了しました"
    end
    redirect_to room_path(@room)
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @user = current_user
  end

  def edit
    @room = Room.find(params[:id])
    @user = current_user
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    redirect_to rooms_path(@room)
  end

  def search
        @search = Room.ransack(params[:q])
        @rooms = @search.result
        @user = current_user
      end

  private
  def room_params
    params.require(:room).permit(:title, :body, :price, :adress, :room_image, :user_id)
  end
end
