class TablesController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.where(completed: false)
  end

  def new
    @table = Table.new
  end


  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path, notice: "Table save successfully!!"

    else
      render :new, notice: "Error, try again."
    end
  end


  def show
    #@table = Table.find(params[:id])
  end


  def edit
    #@table = Table.find(params[:id])
  end


  def update
    # @table = Table.find(params[:id])
    @table.update(table_params)

    redirect_to tables_path #cambiar luego para path hacia los inventarios
  end



  def destroy
    # @table = Table.find(params[:id])
    @table.destroy

    redirect_to tables_path, notice: "Template destroyed"
  end

  def completed
    @table = Table.where(completed: true)
  end

  private
  def table_params
    params.require(:table).permit(:product, :description, :qty, :price, :total_price, :completed)
  end

  def current
    @table = Table.find(params[:id])
  end
end
