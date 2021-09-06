class AddFieldsToPresents < ActiveRecord::Migration[6.1]
  def change
    change_table :presents do |t|
      t.string :name
      t.integer :order
      t.boolean :complete
    end
  end
end
