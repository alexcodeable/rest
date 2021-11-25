class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_cats


  def invoice
    
  end
  # GET /products or /products.json
  def index
    @page = 'menu'
    @pageinfo = 'Order your favourite food from our list of menu'
    
    @q = Product.ransack(params[:q])
    @products = @q.result.includes(:category).to_a.uniq
    
    @order_item = current_order.order_items.new
  end

  # GET /products/1 or /products/1.json
  def show
    @order_item = current_order.order_items.new

  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.category = Category.find(params[:product][:category_id])

    respond_to do |format|
      if @product.save
        flash[:notice] = "Product was successfully created."
        format.html { redirect_to ('/dashboard/view-products'), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    @product.category = Category.find(params[:product][:category_id])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to ('/dashboard/view-products'), notice: "Product was successfully updated." }
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
      format.html { redirect_to ('/dashboard/view-products'), notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_cats
      @cats = Category.all.where(display: true)
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :dairy_free, :gluten_free, :kosher, :peanut_free, :vegan, :image, :category_id, :available, :catering, :featured)
    end
end
