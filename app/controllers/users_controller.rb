class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @card_posts = @user.card_posts
  end
end
