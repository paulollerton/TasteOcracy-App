class Api::UsersController < ApplicationController
  before_action :authenticate_user

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
    @user = User.find(params[:id])
    @user.username = params[:username] || @user.username
    @user.email = params[:email] || @user.email
    @user.password = params[:password] || @user.password
    @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation
    @user.image_url = params[:image_url] || @user.image_url
    @user.bio = params[:bio] || @user.bio

    if @user.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @user.errors.full_messages}, status: :bad_request
    end
    
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {message: "User Deleted"}
  end

end
