class Api::CommentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @comments = Comment.all
    render "index.json.jbuilder"
  end

  def show
    @comment = Comment.find(params[:id])
    render "show.json.jbuilder"
  end

  def create
    if current_user
      @comment = Comment.new(
        user_id: params[:user_id],
        recipe_id: params[:recipe_id],
        content: params[:content],
        username: params[:username]
        )
      if @comment.save
        render "show.json.jbuilder"
      else
        render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {errors: "Please login or create an account to make a comment."}
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id.to_i
      @comment.user_id = params[:user_id] || @comment.user_id
      @comment.recipe_id = params[:recipe_id] || @comment.recipe_id
      @comment.content = params[:content] || @comment.content
      if @comment.save
        render "show.json.jbuilder"
      else
        render json: {errors: @comment.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {message: "Please login to edit this comment."}
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id.to_i
      @comment.destroy
      render json: {message: "Comment Deleted"}
    else
      render json: {message: "Please login to delete this comment."}
    end
  end

end
