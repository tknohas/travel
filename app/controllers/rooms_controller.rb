class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :search]
  def index
    @rooms = Room.all
    @user = current_user
    if @user =! current_user
      redirect_to new_user_session_path
    end
  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "登録が完了しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
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
    #@rooms = Room.where('title LIKE ? or adress LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
    @rooms = Room.where('adress LIKE ?', "%#{params[:adress]}%").where('body LIKE ? OR title LIKE ?', "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    @user = current_user
    #@search = Room.ransack(params[:q])
    #@results = @search.result
  end

  private
  def room_params
    params.require(:room).permit(:title, :body, :price, :adress, :room_image, :user_id)
  end
end
