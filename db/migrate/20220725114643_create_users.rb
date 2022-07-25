class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: "", unique: true
      t.string :encrypted_password, null: false, default: ""
      t.string :nickname,           null: false
      t.string :first_name,         null: false
      t.string :last_name,          null: false
      t.string :first_name_kana,    null: false
      t.string :last_name_kana,     null: false
      t.string :birth_date,         null: false
      t.timestamps
    end
  end
end
