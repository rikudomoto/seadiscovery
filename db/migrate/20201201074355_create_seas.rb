class CreateSeas < ActiveRecord::Migration[6.0]
  def change
    create_table :seas do |t|
      t.references :user,         foreign_key: true
      t.string     :seaname,      null: false
      t.string     :address,      null: false
      t.text       :explanation,  null: false
      t.integer    :car_id,       null: false
      t.integer    :shower_id,    null: false
      t.integer    :area_id,      null: false
      t.timestamps
    end
  end
end
