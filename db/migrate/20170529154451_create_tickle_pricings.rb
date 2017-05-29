class CreateTicklePricings < ActiveRecord::Migration[5.0]
  def change
    create_table :tickle_pricings do |t|
      t.string :name
      t.string :path
      t.string :content

      t.timestamps
    end
  end
end
