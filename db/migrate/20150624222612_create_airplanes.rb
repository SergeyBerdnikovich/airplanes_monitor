class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :name, null: false, default: ''
      t.string :status, null: false, default: 'in a hangar'

      t.timestamps null: false
    end
  end
end
