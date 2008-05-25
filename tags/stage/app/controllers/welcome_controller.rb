class WelcomeController < ApplicationController
  def index
    @ideas = Idea.find(:all, :order => "created_at desc")
    @users = User.find(:all, :order => "created_at desc")
  end
end
