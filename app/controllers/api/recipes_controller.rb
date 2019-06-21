class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render "index.json.jbuilder"
  end

  def show
    @recipe = Recipe.find(params[:id])
    render "show.json.jbuilder"
  end

  def create

    @recipe = Recipe.new(
      title: params[:title],
      blurb: params[:blurb],
      category: params[:category],
      prep_time: params[:prep_time],
      cook_time: params[:cook_time],
      ingredients: params[:ingredients],
      directions: params[:directions],
      user_id: params[:user_id]
      )

    if @recipe.save
      render "show.json.jbuilder"
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title] || @recipe.title
    @recipe.blurb = params[:blurb] || @recipe.blurb
    @recipe.category = params[:category] || @recipe.category
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.cook_time = params[:cook_time] || @recipe.cook_time
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.user_id = params[:user_id] || @recipe.user_id

    if @recipe.save
      render "show.json.jbuilder"
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    render json: {message: "Recipe Deleted"}
  end

end
