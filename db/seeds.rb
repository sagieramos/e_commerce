# Create users
user1 = User.create(name: "John Doe", username: "johndoe", avatar: "avatar1.jpg", can_sell: true, can_buy: true, admin: false, govt_issue_id: "ABCD123", verified: true, super_admin: false)
user2 = User.create(name: "Jane Smith", username: "janesmith", avatar: "avatar2.jpg", can_sell: false, can_buy: true, admin: false, govt_issue_id: "EFGH456", verified: true, super_admin: false)
super_admin = User.create(name: "Super Admin", username: "superadmin", avatar: "super_admin_avatar.jpg", can_sell: true, can_buy: true, admin: true, govt_issue_id: "ADMIN123", verified: true, super_admin: true)

# Create shopping orders
shopping_order1 = ShoppingOrder.create(customer: user1, product_quantity: 2, total_price: 50.0, payment_method: "cash")
shopping_order2 = ShoppingOrder.create(customer: user2, product_quantity: 1, total_price: 30.0, payment_method: "bank_transfer")

# Create products
product1 = Product.create(name: "Product 1", description: "Description for Product 1", photo1: "photo1.jpg", photo2: "photo2.jpg", photo3: "photo3.jpg", photo4: "photo4.jpg", photo5: "photo5.jpg", photo6: "photo6.jpg", price: 25.0, seller: user1)
product2 = Product.create(name: "Product 2", description: "Description for Product 2", photo1: "photo1.jpg", photo2: "photo2.jpg", photo3: "photo3.jpg", photo4: "photo4.jpg", photo5: "photo5.jpg", photo6: "photo6.jpg", price: 35.0, seller: user2)

# Create notifications
Notification.create(message: "New notification for user 1", user: user1)
Notification.create(message: "New notification for user 2", user: user2)

# Create chats
Chat.create(message: "Hello from user 1", sender: user1, receiver: user2)
Chat.create(message: "Hello from user 2", sender: user2, receiver: user1)

# Create reviews
Review.create(comments: "Great product", star_rating: 5, product: product1, user: user1)
Review.create(comments: "Good experience", star_rating: 4, product: product2, user: user2)

# Create chat files
ChatFile.create(file_name: "chat_file1.txt", chat: Chat.first)
ChatFile.create(file_name: "chat_file2.txt", chat: Chat.second)

# Create review files
ReviewFile.create(file_name: "review_file1.txt", review: Review.first)
ReviewFile.create(file_name: "review_file2.txt", review: Review.second)

# Create contacts
Contact.create(phone1: "1234567890", phone2: "0987654321", ZIP: "12345", user: user1, super_admin: super_admin)
Contact.create(phone1: "9876543210", phone2: "0123456789", ZIP: "54321", user: user2, super_admin: super_admin)
