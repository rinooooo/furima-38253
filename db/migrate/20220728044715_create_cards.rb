class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.integer    :card_number        , null: false
      t.integer    :card_date_month    , null: false
      t.integer    :card_date_year     , null: false
      t.integer    :card_security      , null: false
      t.references :order              , null: false, foreign_key: true
      t.timestamps
    end
  end
end
