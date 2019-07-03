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
    else
      render json: ["Please login or create an account to post a suggestion."]
    end

    if @suggestion.save
      render "show.json.jbuilder"
    else
      render json: {errors: @suggestion.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update

    if current_user
      @suggestion = Suggestion.find(params[:id])

      @suggestion.user_id = current_user.id || @suggestion.user_id
      @suggestion.recipe_id = params[:recipe_id] || @suggestion.recipe_id
      @suggestion.content = params[:content] || @suggestion.content
      @suggestion.vote_count = params[:vote_count] || @suggestion.vote_count
    else
      render json: ["Please login to edit this suggestion."]
    end

    if @suggestion.save
      render "show.json.jbuilder"
    else
      render json: {errors: @suggestion.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy

    if current_user
      @suggestion = Suggestion.find(params[:id])
      @suggestion.destroy
      render json: {message: "Suggestion Deleted"}
    else
      render json: ["Please login to delete this suggestion."]
    end

  end

end
