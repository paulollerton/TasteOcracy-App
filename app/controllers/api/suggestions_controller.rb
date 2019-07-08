class Api::SuggestionsController < ApplicationController

  def index
    @suggestions = Suggestion.all
    render "index.json.jbuilder"
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    if current_user
      @suggestion = Suggestion.new(
        user_id: current_user.id,
        recipe_id: params[:recipe_id],
        content: params[:content],
        vote_count: params[:vote_count],
        )
      if @suggestion.save
        render 'show.json.jbuilder'
      else 
        render json: {errors: @suggestion.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {errors: "Self-destruct in 5..."}
    end
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    if current_user.id == @suggestion.user_id.to_i
      @suggestion.user_id = current_user.id || @suggestion.user_id
      @suggestion.recipe_id = params[:recipe_id] || @suggestion.recipe_id
      @suggestion.content = params[:content] || @suggestion.content
      @suggestion.vote_count = params[:vote_count] || @suggestion.vote_count
      if @suggestion.save
        render "show.json.jbuilder"
      else
        render json: {errors: @suggestion.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: ["Please login to edit this suggestion."]
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    if current_user.id == @suggestion.user_id.to_i
      @suggestion.destroy
      render json: {message: "Suggestion Deleted"}
    else
      render json: ["Please login to delete this suggestion."]
    end
  end

end
