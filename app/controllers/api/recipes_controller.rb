class Api::RecipesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @recipes = Recipe.all
    render "index.json.jbuilder"
  end

  def show
    @recipe = Recipe.find(params[:id])
    render "show.json.jbuilder"
  end

  def create

    if current_user
      @recipe = Recipe.new(
        user_id: current_user.id,
        title: params[:title],
        blurb: params[:blurb],
        category: params[:category],
        prep_time: params[:prep_time],
        cook_time: params[:cook_time],
        ingredients: params[:ingredients],
        directions: params[:directions],
        image_url: params[:image_url]
        )
    else
      render json: ["Please login or create an account to submit a recipe."]
    end

    if @recipe.save
      render "show.json.jbuilder"
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    
    if current_user
      @recipe = Recipe.find(params[:id])

      @recipe.user_id = current_user.id || @recipe.user_id
      @recipe.title = params[:title] || @recipe.title
      @recipe.blurb = params[:blurb] || @recipe.blurb
      @recipe.category = params[:category] || @recipe.category
      @recipe.prep_time = params[:prep_time] || @recipe.prep_time
      @recipe.cook_time = params[:cook_time] || @recipe.cook_time
      @recipe.ingredients = params[:ingredients] || @recipe.ingredients
      @recipe.directions = params[:directions] || @recipe.directions
      @recipe.image_url = params[:image_url] || @recipe.image_url
    else
      render json: ["Please login to edit this recipe."]
    end

    if @recipe.save
      render "show.json.jbuilder"
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy

    if current_user
      @recipe = Recipe.find(params[:id])
      @recipe.destroy
      render json: {message: "Recipe Deleted"}
    else
      render json: ["Please login to delete this recipe."]
    end
  end

end
