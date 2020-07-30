class CreateMusicals < ActiveRecord::Migration[6.0]
  def change
    create_table :musicals do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :venue
      t.date :date

      t.timestamps
    end
  end
end
