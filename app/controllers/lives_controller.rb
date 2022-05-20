class LivesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present? && current_user
      result = Life.search_by_title_and_description(params[:query])
      @lives = result.where('user_id != ?', current_user.id)
    elsif params[:query].present?
      result = Life.search_by_title_and_description(params[:query])
      @lives = result
    elsif current_user
      @lives = Life.where('user_id != ?', current_user.id)
    else
      @lives = Life.all
    end
    if @lives.geocoded
      @markers = @lives.geocoded.map do |life|
        {
          lat: life.latitude,
          lng: life.longitude,
          info_window: render_to_string(partial: "info_window", locals: { life: life })
        }
      end
    end
  end

  def show
    @life = Life.find(params[:id])
  end

  def new
    @life = Life.new
  end

  def create
    @life = Life.new(life_params)
    @life.user = current_user
    if @life.save
      redirect_to life_path(@life)
    else
      render :new
    end
  end

  def edit
    @life = Life.find(params[:id])
  end

  def update
    @life = Life.find(params[:id])
    @life.user = current_user
    if @life.update(life_params)
      redirect_to life_path(@life)
    else
      render :edit
    end
  end

  def destroy
    @life = Life.find(params[:id])
    if @life.user == current_user
      @life.destroy
      notice = "Your life was deleted."
    else
      notice = "This life is not yours to take."
    end
    redirect_to my_lives_path, notice: notice
  end

  def my_lives
    @lives = current_user.lives
  end

  private

  def life_params
    params.require(:life).permit(:title, :description, :price, :photo, :address)
  end
end
