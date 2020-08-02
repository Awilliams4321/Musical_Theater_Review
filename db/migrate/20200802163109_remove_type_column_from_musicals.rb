class RemoveTypeColumnFromMusicals < ActiveRecord::Migration[6.0]
  def change
    remove_column :musicals, :type
  end
end
