class Api::CommentsController < ApplicationController

  def index
    @comments = Comment.all
    render "index.json.jbuilder"
  end

  def show
    @comment = Comment.find(params[:id])
    render "show.json.jbuilder"
  end

  def create

    @comment = Comment.new(
      user_id: params[:user_id],
      recipe_id: params[:recipe_id],
      content: params[:content]
      )

    if @comment.save
      render "show.json.jbuilder"
    else
      render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def update
    @comment = Comment.find(params[:id])

    @comment.user_id = params[:user_id] || @comment.user_id
    @comment.recipe_id = params[:recipe_id] || @comment.recipe_id
    @comment.content = params[:content] || @comment.content

    if @comment.save
      render "show.json.jbuilder"
    else
      render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: {message: "Comment Deleted"}
  end

end
