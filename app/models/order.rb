class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items
  after_create :change_quantity

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  # private
  #   def change_quantity
  #     order_items = LineItem.where(order_id: id)
  #     order_items.each do |item|
  #       puts "alsdfjlaskdjflasdkjflasdkjflasdkjflasdkjfalsdkfj"
  #       puts total_cents
  #       puts item.quantity
  #       puts item.product.quantity
  #       item.product.quantity -= item.quantity
  #       puts item.product.quantity
  #     end
  #
  #   end
end
#
# create_table "orders", force: :cascade do |t|
#   t.integer  "total_cents"
#   t.datetime "created_at",       null: false
#   t.datetime "updated_at",       null: false
#   t.string   "stripe_charge_id"
#   t.string   "email"
# end
