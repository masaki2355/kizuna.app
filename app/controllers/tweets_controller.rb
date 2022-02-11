class TweetsController < ApplicationController

  def index    
    
    @schoolname = current_user.schoolname
    @tweets = Tweet.all.order(created_at: :desc).page(params[:page]).per(10)

  end

  def show
    @tweets = Tweet.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(10)
    
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(params.require(:tweet).permit(:schoolyear, :event).merge(user_id: current_user.id))

    if @tweet.save
      redirect_to tweets_path(@tweet)
    else
      render :new
    end
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    
    if @tweet.update(params.require(:tweet).permit(:schoolyear, :event))
      flash[:notice] = "ユーザーが「#{@tweet.id}」の情報を編集しました"
      redirect_to :tweets
    else
      render "edit"
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to :tweets
    
  end
end
