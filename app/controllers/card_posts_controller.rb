class CardPostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @card_posts = CardPost.all.order(created_at: :desc)
  end

  def new
    @card_post = CardPost.new
  end

  def create
    @card_post = current_user.card_posts.build(card_post_params)
    if @card_post.save
      redirect_to @card_post, notice: "カード情報を投稿しました！"
    else
      flash.now[:alert] = "入力に問題があります。修正してください。"
      render :new
    end
  end

  def show
    @card_post = CardPost.find(params[:id])
  end

  private

  def card_post_params
    params.require(:card_post).permit(:store_name, :card_name, :price, :memo, :latitude, :longitude, :image)
  end
end
