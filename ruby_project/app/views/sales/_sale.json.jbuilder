json.extract! sale, :id, :total_amount, :client_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)