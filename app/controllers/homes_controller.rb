class HomesController < ApplicationController
  before_action :set_home, only: [:show, :update, :destroy]

  def index
    @homes = Home.all

    render json: @homes
  end

  def show
    render json: @home
  end

  def create
    @home = Home.new(home_params)

    if @home.save
      render json: @home, status: :created, location: @home
    else
      render json: @home.errors, status: :unprocessable_entity
    end
  end

  def update
    if @home.update(home_params)
      render json: @home
    else
      render json: @home.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @home.destroy
  end

  private
    def set_home
      @home = Home.find(params[:id])
    end

    def home_params
      params.require(:home).permit(
        :name,
        :description,
        :user_id,
        :featured_image
      )
    end
end
