class ItemsController < ApplicationController
  def index
  	@items = Item.all.order('priority ASC').where(complete: false)
  end

  def new
  	@item = Item.new
  end

  def edit
  	@item = Item.find(params[:id])
  end

  def show
  	@item = Item.find(params[:id])
  end

  def create
  	@item = Item.new(item_params)

  	if @item.save
  		redirect_to items_path
  	else
  		render :new
  	end
  end

  	def update
		@item = Item.find(params[:id])
		if @item.update(item_params)
			redirect_to items_path
		else
			render :edit
		end
	end

  def destroy
  	Item.find(params[:id]).destroy
  	redirect_to items_path
  end

  def completed
  	@items = Item.all.order('priority ASC').where(complete: true)
  end

private

def item_params
	params.require(:item).permit(:name, :description, :complete, :priority)
end

end
