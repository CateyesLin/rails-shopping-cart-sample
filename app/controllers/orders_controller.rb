class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params.merge(
      payment: 1,
      status: 2
    ))

    if nil == current_user.receivers.find(@order.receiver_id)
      format.html { render :new }
      format.json { render json: @order.errors, status: :unprocessable_entity }
      return
    end

    respond_to do |format|
      begin
        Order.transaction do
          @order.save!
          @cart.items.each do |item|
            to_buy = OrderProduct.new(
              order_id: @order.id,
              product_id: item.product_id,
              pricing: item.pricing,
              amount: item.amount
            )
            to_buy.save
          end
        end

        session[:cart] = nil

        format.html { redirect_to user_path(current_user.id), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      rescue ActiveRecord::RecordInvalid => invalid
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:receiver_id)
    end
end
