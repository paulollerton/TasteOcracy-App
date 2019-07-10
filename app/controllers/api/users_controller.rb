class Api::UsersController < ApplicationController

  before_action :authenticate_user, only: [:update, :destroy] 

  def show
    user_id = params[:id]
    @user = User.find_by(id: user_id)
    render "show.json.jbuilder"
  end

  def create
    @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url],
      bio: params[:bio]
    )

    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
  end

  def update
    if current_user.id == params[:id].to_i
      @user = User.find(params[:id])
      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      @user.password = params[:password] || @user.password_digest
      @user.password_confirmation = params[:password_confirmation]
      @user.image_url = params[:image_url] || @user.image_url
      @user.bio = params[:bio] || @user.bio

      if @user.save
        render "show.json.jbuilder", status: :created
      else
        render json: {errors: @user.errors.full_messages}, status: :bad_request
      end
    else
      render json: {message: "Please login to edit your profile."}
    end
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.id == params[:id].to_i
      @user.destroy
      render json: {message: "User Deleted"}
    else
      render json: {message: "Unauthorized"}
    end
  end

end
