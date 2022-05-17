class LivesController < ApplicationController
  def index
    @lives = Life.all
  end
end
