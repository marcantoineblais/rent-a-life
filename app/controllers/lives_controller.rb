class LivesController < ApplicationController
  def index
    @lives = Life.all
  end

  def show
    @life = Life.find(params[:id])
  end

  def edit
    @life = Life.find(params[:id])
  end

  def update
    @life = Life.find(params[:id])
    @life.user = current_user
    @life.update(life_params)

    redirect_to life_path(@life)
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
    params.require(:life).permit(:title, :description, :price)
  end
end
