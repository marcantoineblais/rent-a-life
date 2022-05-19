class LivesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @lives = Life.all.reject { |live| live.user == current_user }
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
    @life.destroy

    redirect_to lives_path
  end

  def my_lives
    @lives = current_user.lives
  end

  private

  def life_params
    params.require(:life).permit(:title, :description, :price, :photo)
  end
end
