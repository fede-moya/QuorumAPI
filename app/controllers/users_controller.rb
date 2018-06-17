class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    if user_params[:status].present?
      @users = @users.where(status:user_params[:status])
    end
    json_response(@users)
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # PUT /users/:id
  def update
    @user.update(user_params)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end


  def authenticate
    @user = User.where(user:user_params[:user]).first
    if @user.nil?
      json_response(authenticated:false,message:"No such user")
    else
      if @user.password.eql? user_params[:password]
        a = @user.update(ip:user_params[:ip])
        if @user.errors.any?
          json_response(authenticated:false,message:@user.errors.full_messages.first)
        else
          json_response(@user)
        end
      else
        json_response(authenticated:false,message:"Wrong password")
      end
    end
  end

  def tweet
    @user = User.where(user:user_params[:user]).first
    @user.tweet(user_params[:tweet])
    json_response("Todo bien")
  end

  private

  def user_params
    params.permit(:ip, :user, :email, :status, :password, :created_by, :updated_at,:tweet)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
