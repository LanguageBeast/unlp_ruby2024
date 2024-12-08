class SalesController < ApplicationController
  before_action :set_sale, only: %i[ show edit update destroy ]

  # GET /sales or /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1 or /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @products = Producto.all
  end

  # GET /sales/1/edit
  def edit
    # You cannot edit a sale
  end

  # POST /sales or /sales.json
  def create
    @sale = Sale.new(sale_params)
    @sale.products_chosen = extract_product_params
    @sale.products_db = Producto.where(id: @sale.products_chosen.keys).pluck(:id, :available_stock).to_h
    @products = Producto.all

    respond_to do |format|
      if @sale.valid?
        ActiveRecord::Base.transaction do
          @sale.total_amount = 0
          chosen_products = []

          @products.each do |product|
            amount_sold = params["product-#{product.id}"].to_i
            next if amount_sold <= 0

            if amount_sold > product.available_stock
              raise ActiveRecord::Rollback
            end

            sale_product = @sale.sale_products.build(
              product: product,
              amount: amount_sold,
              total_amount: amount_sold * product.unit_price,
            )

            @sale.total_amount += sale_product.total_amount
            product.available_stock -= amount_sold
            product.save!(validate: false) # saltamos las validaciones de Producto ya que no necesitamos validarlas aquí
            chosen_products << sale_product
          end
          @sale.save
        end
        format.html { redirect_to @sale, notice: "The sale was successfully added!" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    # You cannot edit a sale
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_path, status: :see_other, notice: "Sale was successfully canceled." }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sale
    @sale = Sale.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def sale_params
    params.expect(sale: [:total_amount, :client_id])
  end

  def extract_product_params
    product_params = {}
    params.each do |key, value|
      if key.start_with?("product-") and value.present?
        product_id = key.split("-").last.to_i
        amount = value.to_i
        product_params[product_id] = amount if amount > 0
      end
    end
    product_params
  end
end
