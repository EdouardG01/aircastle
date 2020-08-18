class AddReservationDefaultToStatus < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :status, :string, :default=>"pending"
  end
end
