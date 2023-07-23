class ApplicationController < ActionController::Base

  def check_account
    unless account_signed_in?
      redirect_to new_account_session_path
    end
  end
end
