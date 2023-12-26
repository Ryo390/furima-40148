class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefecture do |t|

      t.timestamps
    end
  end
end
