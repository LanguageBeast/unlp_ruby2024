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
