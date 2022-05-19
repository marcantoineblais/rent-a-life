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

  def destroy
    @booking = Booking.find(params[:id])
    if current_user == @booking.life.user
      @booking.cancelled!
      notice = 'This booking was cancelled'
    else
      notice = "You do not have the permission to cancel this booking. Please contact this life's owner."
    end
    redirect_to requests_path, notice: notice
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
    if @booking.life.user == current_user && @booking.update(status_params) && @booking.accepted?
      refuse_conflicts!
      redirect_to requests_path
    elsif @booking.user == current_user && @booking.update(pending_edit_params)
      redirect_to bookings_path
    else
      return false
    end
  end

  def refuse_conflicts!
    @booking.possible_conflicts.each(&:refused!)
  end
end
