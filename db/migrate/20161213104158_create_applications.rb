class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :problem
      t.text :solution
      t.text :target_market
      t.text :revenue_streams
      t.text :channels
      t.text :traction
      t.text :funding
      t.text :team
      t.text :other

      t.timestamps
    end
  end
end
