class AddSeats < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :seats, :string
  end
end
