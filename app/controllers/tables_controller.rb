class TablesController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]

  def index
    @tables = Table.where(completed: false)
  end

  def completed
    @tables = Table.where(completed: true)
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
  end


  def edit
  end


  def update
    # @table = Table.find(params[:id])
    @table.update(table_params)

    redirect_to tables_path #cambiar luego para path hacia los inventarios
  end



  def destroy
    if @tables = Table.where(completed: true)
      @table.destroy
      redirect_to completed_path, :notice => 'Successfully deleted'
    elsif @table = Table.where(completed: false)
      @table.destroy
      redirect_to table_path, :notice => 'Successfully deleted'
    end
  end


  private
  def table_params
    params.require(:table).permit(:product, :description, :qty, :price, :total_price, :completed)
  end

  def current
    @table = Table.find(params[:id])
  end
end
