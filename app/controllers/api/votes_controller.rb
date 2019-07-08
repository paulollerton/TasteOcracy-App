class Api::VotesController < ApplicationController

  def show
    @vote = Vote.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    if current_user
      @vote = Vote.new(
        user_id: params[:user_id],
        recipe_id: params[:recipe_id],
        suggestion_id: params[:suggestion_id],
        vote_value: params[:vote_value]
        )
      if @vote.save
        render "show.json.jbuilder"
      else
        render json: {errors: @vote.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Please login or create an account to vote."}
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    if current_user.id == @vote.user_id.to_i
      @vote.destroy
      render json: {message: "Vote Deleted"}
    else
      render json: {message: "Please login to delete this vote."}
    end
  end

end
