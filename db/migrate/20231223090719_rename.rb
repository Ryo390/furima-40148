class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :prefectur_id, :prefecture_id
  end
end
