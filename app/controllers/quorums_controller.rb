class QuorumsController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :create]

  # POST /quorums
  def create
    if @user.nil?
      json_response({messagge:"User not found"},:not_found)
    else
      @quorum = Quorum.create({user:@user})
      json_response(@quorum.id, :created)
    end
  end

  private

  def quorum_params
    params.permit(:user, :created_by, :updated_at)
  end

  def set_user
    @user = User.where(user:params[:user]).first
  end

end

