class CatsController < ApplicationController

  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def edit
    @cat = Cat.find(params[:id])
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      render :new
    end
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update_attributes(cat_params)
    if @cat.save
      redirect_to cats_url
    else
      render :edit
    end
  end

  private
  def cat_params
    params.require(:cat).permit(:birthdate, :color, :name, :description, :sex)
  end
end
