class Api::CourtsController < ApplicationController
  before_action :set_court, only: [:show, :update, :destroy]

  # GET /courts
  def index
    @courts = Court.all

    render json: @courts
  end

  # GET /courts/1
  def show
    render json: @court
  end

  # POST /courts
  def create
    @court = Court.new(court_params)

    if @court.save
      render json: @court, status: :created, location: @court
    else
      render json: @court.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courts/1
  def update
    if @court.update(court_params)
      render json: @court
    else
      render json: @court.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courts/1
  def destroy
    @court.destroy
  end
  
  def search
    @courts = Court.near(params[:zip_code], params[:distance])
    render json: @courts
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_court
      @court = Court.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def court_params
      params.require(:court).permit(:name, :description, :status, :address, :latitude, :longitude)
    end
end
