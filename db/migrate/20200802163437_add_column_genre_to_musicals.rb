class AddColumnGenreToMusicals < ActiveRecord::Migration[6.0]
  def change
    add_column :musicals, :genre, :string
  end
end
