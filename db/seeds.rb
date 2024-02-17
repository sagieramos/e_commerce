# Users
User.create([
              { name: 'John Doe', username: 'johndoe', avatar: 'avatar1.jpg', contact_email: 'john@example.com',
                phone1: '123456789', address: '123 Main St', can_sell: true, can_buy: true, admin: false, verified: true },
              { name: 'Jane Smith', username: 'janesmith', avatar: 'avatar2.jpg', contact_email: 'jane@example.com',
                phone1: '987654321', address: '456 Elm St', can_sell: true, can_buy: true, admin: false, verified: true }
            ])

# Products
Product.create([
                 { name: 'Product 1', description: 'Description of Product 1', seller_id: 1, price: 10.99 },
                 { name: 'Product 2', description: 'Description of Product 2', seller_id: 2, price: 19.99 }
               ])

# Shopping Orders
ShoppingOrder.create([
                       { buyer_id: 1, product_quantity: 2, total_price: 21.98, payment_method: 'cash' },
                       { buyer_id: 2, product_quantity: 1, total_price: 19.99, payment_method: 'bank_transfer' }
                     ])

# Notifications
Notification.create([
                      { message: 'You have a new message', user_id: 1 },
                      { message: 'Your order has been shipped', user_id: 2 }
                    ])

# Chats
Chat.create([
              { message: 'Hello', sender_id: 1, receiver_id: 2 },
              { message: 'Hi there', sender_id: 2, receiver_id: 1 }
            ])

# Product Reviews
ProductReview.create([
                       { comments: 'Great product!', product_id: 1, buyer_id: 1 },
                       { comments: 'Good quality', product_id: 2, buyer_id: 2 }
                     ])

puts 'Seeds created successfully!'
