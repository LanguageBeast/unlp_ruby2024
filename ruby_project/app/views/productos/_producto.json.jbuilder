json.extract! producto, :id, :nombre, :descripcion, :precio_unitario, :stock_disponible, :imagenes, :categoria, :talle, :color, :fecha_ingreso, :fecha_ultima_modificacion, :fecha_baja, :created_at, :updated_at
json.url producto_url(producto, format: :json)
