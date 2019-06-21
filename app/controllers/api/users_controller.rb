class Api::UsersController < ApplicationController

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
    @user.username = params[:username] || @user.username
    @user.username = params[:username] || @user.username
    @user.username = params[:username] || @user.username
    
  end

end
