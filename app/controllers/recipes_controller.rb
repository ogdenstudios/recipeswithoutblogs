class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :meal]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    params[:page] ? page = params[:page] : page = 1
    @recipes = Recipe.order("created_at DESC").offset((page.to_i * 10) - 10).first(10)
    @page_count = (Recipe.count.to_i / 10) + 1
  end

  def show
    @current_user = current_user
    @description = @recipe.description
    @image_url = @recipe.picture.url
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
    params[:page] ? page = params[:page] : page = 1
    @recipes = Recipe.order("created_at DESC").where(meal_category: params[:slug]).offset((page.to_i * 10) - 10).first(10)
    @meal = params[:slug]
    @page_count = (Recipe.where(meal_category: params[:slug]).count.to_i / 10) + 1
    render "index"
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :meal_category, :picture, :slug, :page, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :order, :_destroy])
  end

  def correct_user
    @user = User.find(Recipe.find(params[:id]).user_id)
    redirect_to(root_url) unless @user == current_user
  end
end
