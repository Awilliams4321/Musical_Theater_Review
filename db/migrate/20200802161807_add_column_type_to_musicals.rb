class AddColumnTypeToMusicals < ActiveRecord::Migration[6.0]
  def change
    add_column :musicals, :type, :string
  end
end
