class Api::V1::ProductsController < Api::V1::ApiController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_api_v1_user!, except: [:index]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  def my_products
    @product = current_api_v1_user.products
    render :index, location: @products
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user = current_api_v1_user
    respond_to do |format|
      if @product.save
        params[:product][:properties].each do |k,v|
          @product.product_properties.create(property: Property.find(k), value: v)
        end
        params[:product][:colors].each do |c|
          @product.colors.create(name: c[:name].downcase, code: c[:code])
        end
        params[:product][:photos].each do |c|
          @product.photos.create(image: c)
        end
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created}
      else
        format.html { render :new }
        format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @product.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { render :show, status: :ok}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = current_api_v1_user.products.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :sub_category_id, :user_id, :availablity, :price, :condition, :description, :specification, :sku, :details, :photos, :colors, :properties)
    end
end
