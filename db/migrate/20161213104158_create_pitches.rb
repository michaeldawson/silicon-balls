class CreatePitches < ActiveRecord::Migration[5.0]
  def change
    create_table :pitches do |t|
      t.text :company_name
      t.text :problem
      t.text :current_solutions
      t.text :solution
      t.text :target_market
      t.text :channels
      t.text :revenue_streams
      t.text :competitive_advantage
      t.text :team
      t.text :founders
      t.text :traction
      t.text :obstacles
      t.text :funding
      t.text :other

      t.timestamps
    end
  end
end
