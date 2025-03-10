class ListsController < ApplicationController
  before_action :set_list, only:[:edit, :update, :destroy]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  def sort
    list = List.find(params[:list_id])
    list.update!(list_params)
    render body: nil
  end

  private
    def list_params
      params.require(:list).permit(:title, :row_order_position).merge(user: current_user)
    end  

    def set_list
      @list = List.find_by(id: params[:id])
    end
end
