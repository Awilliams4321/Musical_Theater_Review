class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :headline
      t.string :content
      t.string :public_name
      t.date :date

      t.timestamps
    end
  end
end
