class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
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

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
