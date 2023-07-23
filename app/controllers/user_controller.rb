class UserController < ApplicationController
  before_action :check_account

  def index
    if account_signed_in?
      if current_account.profile.present?
        @follow = Follow.new
        @profiles = Profile.all
      else
        redirect_to new_profile_path
      end
    else
      redirect_to new_account_session_path
    end
  end

  def all_user

  end
end
