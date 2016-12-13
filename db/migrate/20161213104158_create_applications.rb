class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.text :team
      t.text :problem
      t.text :solution
      t.text :uvp
      t.text :segments
      t.text :metrics
      t.text :channels
      t.text :cost_structure
      t.text :revenue_streams
      t.text :funding
      t.text :funding_equity

      t.timestamps
    end
  end
end
