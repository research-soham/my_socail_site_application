class FollowsController < ApplicationController
  before_action :set_follow, only: [:destroy]

  def create
    @follow = Follow.new(followparams)
    @follow.save
    redirect_to request.referrer
  end

  def destroy
    @follow.destroy
    redirect_to request.referrer
  end

  def following
    @follows = Follow.select(:account_id).where(current_account_id: current_account.id)
    @accounts = Account.where(id: @follows)
  end

  def follower
    @follows = Follow.select(:current_account_id).where(account_id: current_account.id)
    @follow = Follow.new
    @accounts = Account.where(id: @follows)
  end

  private
  def followparams
    params.require(:follow).permit(:account_id, :current_account_id)
  end

  def set_follow
    @follow = Follow.find_by(id: params[:id])
  end
end
