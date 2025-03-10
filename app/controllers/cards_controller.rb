class CardsController < ApplicationController
  before_action :set_card, only:[:show, :edit, :update, :destroy]

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def show
    
  end

  def edit
    @lists = List.where(user: current_user)
  end

  def update
    if @card.update_attributes(card_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to :root
  end

  def sort
    card = Card.find(params[:card_id])
    card.update!(card_params)
    render body: nil
  end

  private
    def card_params
      params.require(:card).permit(:title, :memo, :list_id, :row_order_position)
    end

    def set_card
      @card = Card.find_by(id: params[:id])
    end
end
