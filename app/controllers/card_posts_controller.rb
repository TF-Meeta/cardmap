class CardPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_card_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @card_posts = CardPost.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @card_post = CardPost.new
  end

  def create
    @card_post = current_user.card_posts.build(card_post_params)
    if @card_post.save
      redirect_to @card_post, notice: "投稿を作成しました。"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @card_post.update(card_post_params)
      redirect_to @card_post, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @card_post.destroy
    redirect_to card_posts_path, notice: "投稿を削除しました。"
  end

  private

  def set_card_post
    @card_post = CardPost.find(params[:id])
  end

  def authorize_user!
    redirect_to root_path, alert: "権限がありません" unless @card_post.user == current_user
  end

  def card_post_params
    params.require(:card_post).permit(:card_name, :store_name, :price, :image)
  end
end
