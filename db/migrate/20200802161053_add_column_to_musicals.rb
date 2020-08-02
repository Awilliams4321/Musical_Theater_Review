class AddColumnToMusicals < ActiveRecord::Migration[6.0]
  def change
    add_column :musicals, :info, :string
  end
end
