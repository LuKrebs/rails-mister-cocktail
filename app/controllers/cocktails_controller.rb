class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show, :edit, :update, :destroy, :chef]

  def index
    @cocktails = Cocktail.all
  end

  def show
    # @doses = Dose.where(cocktail_id: @cocktail.id)
    # @ingredients = []
    # @doses.each do |dose|
    #   @ingredients << Ingredient.find(dose.id)
    # end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end