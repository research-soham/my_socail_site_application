class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def show
    @accounts = Account.all
    @posts = Post.where(account_id: @profile.account_id)
  end

  def new
    @profile = Profile.new()
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.account_id = current_account.id
    if @profile.save
      redirect_to @profile
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit 
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile
    else
      redirect_to edit_profile_path(@profile)
    end
  end

  def destroy
    if @profile.destroy

    else
      redirect_to root_path
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:name, :user_name, :city, :gender, :mobile, :date_of_birth, :profile_image)
  end

  def set_profile
    @profile = Profile.find_by(id: params[:id])
  end
end
