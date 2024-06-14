class OrdersController < ApplicationController
   before_action :authorize_request

  def index
    orders = @current_user.orders
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    render json: order
  end

  def create
    order = @current_user.orders.build(order_params)
    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:status, :total_price, order_items_attributes: [:product_id, :quantity, :price])
  end

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    decoded = JWT.decode(header, 'your_secret_key')[0]
    @current_user = User.find(decoded['user_id'])
  rescue ActiveRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end
end
