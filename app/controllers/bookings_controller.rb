class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
    @life = Life.find(@booking.life_id)
  end

  def new
    @life = Life.find(params[:life_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @life = Life.find(params[:life_id])
    @booking.life = @life
    if @booking.save
      redirect_to life_bookings_path(@life)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @life = @booking.life
    if @booking.update(status_params)
      redirect_to life_bookings_path(@life)
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def status_params
    params.require(:booking).permit(:status)
  end
end
