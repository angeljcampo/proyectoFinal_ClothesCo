class ProductsController < ApplicationController

  before_action :set_product, :authenticate_user!, only: %i[ show edit update destroy]
  before_action :authenticate_admin_user!, only: %i[ new create edit update destroy ]

  # GET /products or /products.json
  def index
    if params[:q]
      @products = @q.result(distinct: true)
    else
      @products = Product.all
    end
    if current_user
      @order = Order.find_by(user_id: current_user.id)
    end
    @products = Kaminari.paginate_array(@products).page(params[:page]).per(4)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @categories = Category.all
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @categories = Category.all
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Tu producto ha sido creado con exito." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @categories = Category.all
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :gender, :stock, :category_id, images: [])
    end
end
