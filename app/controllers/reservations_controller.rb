class ReservationsController < ApplicationController
  protect_from_forgery :except => [:confirm]

  def index
    @user = User.find(current_user.id)
    @reservations = Reservation.where(id: @user.id)
  end

  def confirm
    @reservation = Reservation.new(id: params[:id])
    @reservation.assign_attributes(params.require(:reservation).permit(:room_id, :start_day, :end_day, :created_at, :number_of_people))
    @room = Room.find(@reservation.room_id)
    if @reservation.invalid?
      flash[:alert] = "予約確定へ進むことができませんでした。"
      flash.discard(:alert)
      render 'rooms/show'
    else
      @number_of_days = (@reservation.end_day - @reservation.start_day).to_i
      @reservation.total_charge = @number_of_days * @reservation.number_of_people * @room.charge
    end
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:id, :room_id, :start_day, :end_day, :created_at, :number_of_people, :total_charge))
    if @reservation.save
      flash[:notice] = "予約を確定しました。"
      flash.discard(:notice)
      redirect_to reservation_path(@reservation.id)
    else
      flas[:alert] = "予約確定へ進むことができませんでした。"
      flash.discard(:alert)
      @room = Room.find(@reservation.room_id)
      @reservation = Reservation.new
      render 'rooms/show'
    end

  end

  def show
    if params[:confirm]
      render 'tops/home'
    else  
      @reservation = Reservation.find(params[:id])
      @room = Room.find(@reservation.room_id)
    end
  end
    
  def reservation_params
    params.require(:reservation).permit(:room_id, :start_day, :end_day, :created_at, :number_of_people, :total_charge)
  end

end