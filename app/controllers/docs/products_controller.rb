class Docs::ProductsController < Docs::DoctorsController
	before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'El producto fue creado exitosamente.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'El producto fue actualizado exitosamente.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'El producto fue eliminado exitosamente' }
    end
  end

  private
  	def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :code, :price, :expiration_date, :characteristics, :status)
    end
end

