class TweetsController < ApplicationController
  
  before_action :move_to_index, except: :index
  def index
     @tweets = Tweet.order("created_at DESC").page(params[:page]).per(5)
    #test = %!<iframe width="560" height="315" src="https://www.youtube.com/embed/UtoReZlTvu4" frameborder="0" allowfullscreen></iframe>!
    #@test = test
  end
  def new
    
  end
  def create
      Tweet.create(tweet_params)
    end

    private
    def tweet_params
      params.permit(:title, :video, :text)
    end
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

end

