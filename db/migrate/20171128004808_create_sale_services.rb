class CreateSaleServices < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_services do |t|
      t.references :sale, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
