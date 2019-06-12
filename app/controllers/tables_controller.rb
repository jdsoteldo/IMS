class TablesController < ApplicationController
  before_action :current, only: [:show, :edit, :update, :destroy]

  def index
    @tables = current_user.tables.where(completed: false)
  end

  def completed
    @tables = current_user.tables.where(completed: true)
  end


  def new
    @table = Table.new
  end


  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to tables_path

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
    if @table.completed
      @table.destroy
      redirect_to completed_path
    else
      @table.destroy
      redirect_to tables_path
    end
  end


  private
  def table_params
    params.require(:table).permit(:product, :description, :qty, :price, :total_price, :completed, :user_id)
  end

  def current
    @table = Table.find(params[:id])
  end
end
