class AddContactDetailsToPitches < ActiveRecord::Migration[5.0]
  def change
    add_column :pitches, :contact_details, :string
  end
end
