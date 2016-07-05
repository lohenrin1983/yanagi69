class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    test = %!<iframe width="560" height="315" src="https://www.youtube.com/embed/UtoReZlTvu4" frameborder="0" allowfullscreen></iframe>!
    @test = test
  end
  def new
    
  end
end
