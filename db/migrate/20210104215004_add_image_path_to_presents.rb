class AddImagePathToPresents < ActiveRecord::Migration[6.1]
  def change
    add_column :presents, :image_path, :string
  end
end
