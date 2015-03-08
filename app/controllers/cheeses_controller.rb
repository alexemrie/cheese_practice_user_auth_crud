class CheesesController < ApplicationController
  before_action :ensure_current_user

  def index
    @cheeses = Cheese.all
  end

  def new
    @cheese = Cheese.new
  end

  def create
    @cheese = Cheese.new(cheese_params)

    if @cheese.save
      redirect_to cheeses_path
      flash[:notice] = "Cheese created successfully!"
    else
    end
  end

  def show
    @cheese = Cheese.find(params[:id])
  end

  def edit
    @cheese = Cheese.find(params[:id])
  end

  def update
    @cheese = Cheese.find(params[:id])

    if @cheese.update(cheese_params)
      redirect_to cheese_path(@cheese)
      flash[:notice] = "Cheese updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @cheese = Cheese.find(params[:id])

    @cheese.destroy

    redirect_to cheeses_path
    flash[:notice] = "Deleted cheese: #{@cheese.name}"
  end



  def cheese_params
    params.require(:cheese).permit(:name, :price_per_lb)
  end
end
