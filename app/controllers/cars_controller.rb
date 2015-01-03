class CarsController < ApplicationController
  def index
    @cars = Car.all
    @manufacturers = Manufacturer.all
  end
  def new
    @car = Car.new
    @manufacturers = Manufacturer.all.map { |manufacturer| [manufacturer.name, manufacturer.id]}
  end

  def create
    @cars = Car.all
    @car = Car.new(car_params)
    @manufacturers = Manufacturer.all.map { |manufacturer| [manufacturer.name, manufacturer.id]}

    if @car.save
      redirect_to cars_path
      flash[:notice] = "You have successfully entered a new car listing"
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:manufacturer_id, :color, :year, :mileage, :description)
  end
end
