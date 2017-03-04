class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.string :name # 1 cup of flower
      t.integer
      t.timestamps
    end
  end
end
