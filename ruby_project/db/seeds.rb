User.create!(
  email: "admin@example.com",
  username: "admin_user",
  phone: "1234567890",
  password: "123456",
  role: "admin",
  entry_date: Date.today,
)

User.create!(
  email: "manager@example.com",
  username: "manager_user",
  phone: "1234567890",
  password: "123456",
  role: "manager",
  entry_date: Date.today,
)

User.create!(
  email: "employee@example.com",
  username: "employee_user",
  phone: "1234567890",
  password: "123456",
  role: "employee",
  entry_date: Date.today,
)

# Nota: los productos obtenidos del seeds solo tendrán 1 imagen por simplicidad
products = [
  { name: "Men's Running Shoes", description: "High-performance running shoes for men.", unit_price: 120, available_stock: 50, category: "Athletic Shoes", size: "10", color: "Black", entry_date: Date.today },
  { name: "Women's Yoga Pants", description: "Comfortable and flexible yoga pants.", unit_price: 50, available_stock: 100, category: "Yoga Apparel", size: "M", color: "Blue", entry_date: Date.today },
  { name: "Compression Shirt", description: "Tight-fitting compression shirt for workouts.", unit_price: 40, available_stock: 75, category: "Compression Wear", size: "L", color: "Black", entry_date: Date.today },
  { name: "Sports Bra", description: "Supportive sports bra for high-impact activities.", unit_price: 30, available_stock: 80, category: "Sports Bras", size: "S", color: "Pink", entry_date: Date.today },
  { name: "Training Gloves", description: "Durable gloves for weight training.", unit_price: 25, available_stock: 60, category: "Training Gear", size: "M", color: "Black", entry_date: Date.today },
  { name: "Winter Jacket", description: "Warm jacket for winter sports.", unit_price: 150, available_stock: 40, category: "Winter Sports Gear", size: "L", color: "Green", entry_date: Date.today },
  { name: "Swim Trunks", description: "Quick-drying swim trunks for men.", unit_price: 35, available_stock: 90, category: "Swimwear", size: "M", color: "Blue", entry_date: Date.today },
  { name: "Golf Polo Shirt", description: "Breathable polo shirt for golf.", unit_price: 60, available_stock: 70, category: "Golf Apparel", size: "L", color: "White", entry_date: Date.today },
  { name: "Running Shorts", description: "Lightweight shorts for running.", unit_price: 45, available_stock: 85, category: "Running Gear", size: "M", color: "Black", entry_date: Date.today },
  { name: "Sports Water Bottle", description: "Insulated water bottle for sports.", unit_price: 20, available_stock: 200, category: "Sports Accessories", entry_date: Date.today },
]

products.each_with_index do |product_data, index|
  product = Producto.new(
    name: product_data[:name],
    description: product_data[:description],
    unit_price: product_data[:unit_price],
    available_stock: product_data[:available_stock],
    category: product_data[:category],
    size: product_data[:size],
    color: product_data[:color],
    entry_date: product_data[:entry_date],
  )

  image_path = Rails.root.join("app/assets/images/image_prod#{index + 1}.png")
  product.images.attach(io: File.open(image_path), filename: "image_prod#{index + 1}.png", content_type: "image/png")

  product.save(validate: false)
end
