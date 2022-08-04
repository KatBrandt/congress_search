class CongressController < ApplicationController
  def index
    @members = CongressFacade.members(params[:state])

    render 'congress/index'
  end
end
