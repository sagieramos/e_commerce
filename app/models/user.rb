class User < ApplicationRecord
    has_many :contacts
    has_many :products, foreign_key: :seller_id
    has_many :notifications
    has_many :chats_sent, foreign_key: :sender_id, class_name: "Chat"
    has_many :chats_received, foreign_key: :receiver_id, class_name: "Chat"
    has_many :reviews
    has_many :chat_files
    has_many :review_files
    has_many :shopping_orders, foreign_key: :customer_id
end
