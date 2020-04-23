class RenameType < ActiveRecord::Migration[6.0]
  def change
    rename_column :ports, :type, :port_type
  end
end
