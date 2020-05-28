class TopController < ApplicationController

  def index
    @lists = List.where(user: current_user).rank(:row_order)
  end

end
