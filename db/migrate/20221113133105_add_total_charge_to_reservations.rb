class AddTotalChargeToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :total_charge, :integer
  end
end
