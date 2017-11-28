class SaleService < ApplicationRecord
  belongs_to :sale
  belongs_to :service
end
