class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
    
  def new
    @tweet=Tweet.new
  end
  
  def show
  end
  
  def index
      @tweets=Tweet.all
  end
  
  def edit
  end
  
  def update
      respond_to do |format|
          if @tweet.update(tweet_params)
              format.html { redirect_to @tweet, notice: 'Post was successfully updated.' }
          else
              format.html { render :edit }
              
          end
      end
  end
  
  def destroy
      @tweet.destroy
      redirect_to tweets_url, notice: 'Tweet was successfully destroyed.'
  end 
  
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: "Tweet was successfully created." }
      else
        format.html { render :new }
      end
    end
  end 
  
  private
  
  def set_tweet
    @tweet=Tweet.find(params[:id])
  end
  
  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end
end