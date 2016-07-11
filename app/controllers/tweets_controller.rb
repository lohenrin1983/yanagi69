class TweetsController < ApplicationController
  
   before_action :move_to_index, only: :new 

  def index
     @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("created_at DESC")
    #test = %!<iframe width="560" height="315" src="https://www.youtube.com/embed/UtoReZlTvu4" frameborder="0" allowfullscreen></iframe>!
    #@test = test
  end
  def new
    
  end
  def create
      Tweet.create(title: tweet_params[:title], video: tweet_params[:video], text: tweet_params[:text], user_id: current_user.id)
    end
   def destroy
      tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.destroy
      end
   end
   def update
     tweet = Tweet.find(params[:id])
      if tweet.user_id == current_user.id
        tweet.update(tweet_params)
      end
   end
   def edit
     @tweet = Tweet.find(params[:id])
   end
   def show
     @tweet = Tweet.find(params[:id])
     @comments = @tweet.comments.includes(:user)
   end
    def ranking
      tweet_ids = Comment.group(:tweet_id).order('count_tweet_id DESC').limit(20).count(:tweet_id).keys
      @ranking = tweet_ids.map{ |id| Tweet.find(id)}
    end
    def search
      @tweet = Tweet.where('title LIKE(?)', "%#{params[:keyword]}%")
    end
    def detail
      
    end
    private
    def tweet_params
      # video = video
      # video.slice!(1..32)
      # video = video.match()
    
      video = params[:video]
      video.slice!("https://www.youtube.com/watch?v=")
      params.permit(:title, :video, :text)  
      
    end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end
end
