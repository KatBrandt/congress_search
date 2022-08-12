class WelcomeController < ApplicationController
  def index
    unless cookies[:greeting]
      cookies[:greeting] = 'Howdy!'
    end
  end
end
