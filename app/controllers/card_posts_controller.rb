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

  def toggle_checked
    @card_post = CardPost.find(params[:id])
    if current_user == @card_post.user
      @card_post.update(checked_by_owner: !@card_post.checked_by_owner)
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("check_frame_#{@card_post.id}", partial: "card_posts/check_form", locals: { post: @card_post }) }
      format.html { redirect_back fallback_location: root_path }
    end
  end



  def update
    if current_user == @card_post.user
      if @card_post.update(card_post_params)
        redirect_to @card_post, notice: "更新しました"
      else
        render :edit
      end
    else
      redirect_to @card_post, alert: "権限がありません"
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
