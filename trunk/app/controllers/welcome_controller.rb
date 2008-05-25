class WelcomeController < ApplicationController
  def index
    @pages = Page.find(:all)
    @ideas = Idea.find(:all)
  end
end
