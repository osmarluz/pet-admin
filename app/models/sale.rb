class Sale < ApplicationRecord
  include Fae::BaseModelConcern
  enum status: { Finished: 0, Canceled: 1 }
  
  validates :client, presence: true
  belongs_to :discount
  belongs_to :client
  has_many :product_sales
  has_many :products, through: :product_sales
  has_many :sale_services
  has_many :services, through: :sale_services

  before_save :set_total

  def fae_display_field
    id
  end

  def self.for_fae_index
    order(:id)
  end
  
  def set_total
    total = 0
    self.products.each { |p| total += p.price }
    self.services.each { |s| total += s.price }
 
    if self.discount.present?
      total = total - self.discount.value
    end
 
    total = (total >= 0) ? total : 0
    self.total = total
  end
end
