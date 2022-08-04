class CongressController < ApplicationController
  def index
    @members = CongressFacade.members(params[:state] = "CO")
    render 'congress/index'
  end
end
