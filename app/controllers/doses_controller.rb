class DosesController < ApplicationController
  before_action :set_cocktail, only: [ :create, :new ]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.destroy

    redirect_to cocktail_path(cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # def set_ingredient
  #   @ingredient = Ingredient.find(params[:ingredient_id])
  # end
end

  # def create
  #   @review = Review.new(review_params)
  #   # we need `restaurant_id` to asssociate review with corresponding restaurant
  #   @review.restaurant = @restaurant
  #   @reviews = Review.where(restaurant_id: @restaurant.id)
  #   if @review.save
  #     redirect_to @restaurant
  #   else
  #     render 'new'
  #   end
  # end
