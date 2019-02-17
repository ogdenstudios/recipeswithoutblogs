class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @recipe = Recipe.order("created_at DESC")
  end

  def show
    @current_user = current_user
  end

  def new
    @recipe = current_user.recipes.build
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: "Successfully created new recipe"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to root_path, notice: "Successfully deleted recipe"
  end

  def mine
    @recipes = Recipe.where(user_id: current_user.id).order("created_at DESC")
  end

  def meal 
    @recipes = Recipe.where(meal_category: params[:slug])
    @meal = params[:slug]
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :picture, :slug, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
  end

  def correct_user
    @user = User.find(Recipe.find(params[:id]).user_id)
    redirect_to(root_url) unless @user == current_user
  end
end
