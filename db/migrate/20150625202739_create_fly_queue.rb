class CreateFlyQueue < ActiveRecord::Migration
  def change
    create_table :fly_queues do |t|
      t.references :airplane, null: false

      t.timestamps null: false
    end
  end
end
