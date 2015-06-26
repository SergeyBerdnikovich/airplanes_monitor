class CreateHistory < ActiveRecord::Migration
  def change
    create_table :history_flight do |t|
      t.references :airplane, null: false
      t.string :from, null: false, default: ''
      t.string :to, null: false, default: ''

      t.timestamps null: false
    end
  end
end
