class LivesController < ApplicationController
  def index
    @lives = Life.all
  end

  def destroy
    @life = Life.find(params[:id])
    @life.destroy

    redirect_to lives_path
  end
end
