class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    @card_posts = @user.card_posts.order(created_at: :desc)
  end
end
