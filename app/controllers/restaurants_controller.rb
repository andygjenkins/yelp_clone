class RestaurantsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]

  def index
      @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)    # Don't think this is needed!
    if @restaurant.save
      flash[:notice] = 'Restaurant added successfully'
      redirect_to restaurants_path
    else
      render "new"
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    redirect_to "/restaurants"
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    flash[:notice]= "Restaurant successfully deleted"
    redirect_to '/restaurants'
  end

  private
  def restaurant_params
    list_params_allowed = [:name, :description]
    params.require(:restaurant).permit(list_params_allowed)
  end
end
