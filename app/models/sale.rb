class Sale < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { finished: 0, canceled: 1 }
  
  validates :client, presence: true
  belongs_to :discount
  belongs_to :client
  has_many :product_sales
  has_many :products, through: :product_sales
  has_many :sale_services
  has_many :services, through: :sale_services

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end
  
end
