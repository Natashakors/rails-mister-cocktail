class DosesController < ApplicationController
  before_action :set_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
    @cocktail = cocktail.find(params[:cocktail_id])
  end

  def create
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params[:dose][:ingredient]) unless params[:dose][:ingredient].blank?
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

end

