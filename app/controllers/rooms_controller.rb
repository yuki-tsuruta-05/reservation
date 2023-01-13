class RoomsController < ApplicationController
  def post
    @user = User.find(current_user.id)
    @rooms = @user.rooms
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:user_id, :room_name, :room_introducution, :charge, :address, :created_at, :updated_at, :room_image ))
    if @room.save
      flash[:notice] = "部屋情報を登録しました。"
      flash.discard(:notice)
      redirect_to controller: :rooms, action: :post, id: current_user.id 
    else
      flash[:alert] = "部屋情報を登録できませんでした。"
      flash.discard(:alert)
      render "new"
    end
    
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def room_params
    params.require(:room).permit(:room_image)
  end

  def search
    @area = params[:area]
    @word = params[:word]

    if  @word == nil ||  @word == ""
      @rooms = Room.looks_word(@area)
    else
      @rooms = Room.lools_word_area(@area,@word)
    end
  end

end
