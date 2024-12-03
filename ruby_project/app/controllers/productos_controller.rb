class ProductosController < ApplicationController
  before_action :set_producto, only: %i[show edit update destroy]

  CATEGORIES = [
    "Activewear", "Athletic Shoes", "Compression Wear", "Sports Bras", "Training Gear",
    "Outerwear", "Yoga Apparel", "Swimwear", "Running Gear", "Sports Accessories",
    "Team Apparel", "Protective Gear", "Winter Sports Gear", "Performance Wear", "Golf Apparel",
  ].freeze

  SEARCH_CATEGORIES = ["All",
                       "Activewear", "Athletic Shoes", "Compression Wear", "Sports Bras", "Training Gear",
                       "Outerwear", "Yoga Apparel", "Swimwear", "Running Gear", "Sports Accessories",
                       "Team Apparel", "Protective Gear", "Winter Sports Gear", "Performance Wear", "Golf Apparel"].freeze

  # GET /productos or /productos.json
  def index
    order_by = params[:order_by] || "name"
    order_direction = params[:order_direction] || "asc"
    if params.dig(:q, :category_eq) == "All"
      params[:q].delete(:category_eq)
    end
    @q = Producto.ransack(params[:q])
    @productos = @q.result(distinct: true).order("#{order_by} #{order_direction}")
    @categories = SEARCH_CATEGORIES
  end

  # GET /productos/1 or /productos/1.json
  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @categories = CATEGORIES
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos or /productos.json
  def create
    @producto = Producto.new(producto_params)
    @categories = CATEGORIES

    respond_to do |format|
      if @producto.save
        # save_images if params[:producto][:images].present?
        format.html { redirect_to @producto, notice: "The product was successfully added!" }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1 or /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        save_images if params[:producto][:imagenes].present?
        format.html { redirect_to @producto, notice: "The product was successfully updated." }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1 or /productos/1.json
  def destroy
    @producto.eliminar

    respond_to do |format|
      format.html { redirect_to productos_path, status: :see_other, notice: "The product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_producto
    @producto = Producto.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def producto_params
    params.expect(producto: [:name, :description, :unit_price, :available_stock, :category, :size, :color, :entry_date, images: []])
  end

  def save_images
    params[:producto][:images].each do |image|
      next if image.blank?
      @producto.images.create(image_data: image)
    end
  end
end
