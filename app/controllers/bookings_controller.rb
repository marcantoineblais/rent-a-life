class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
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
      redirect_to life_path(@life), notice: "Request sent to owner."
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    render :edit unless owner_or_user
  end

  def requests
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def status_params
    params.require(:booking).permit(:status)
  end

  def pending_edit_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def owner_or_user
    if @booking.life.user == current_user
      redirect_to requests_path if @booking.update(status_params)
    elsif @booking.user == current_user
      redirect_to bookings_path if @booking.update(pending_edit_params)
    else
      return false
    end
  end
end
