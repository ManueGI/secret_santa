class CreateSantaAssignements < ActiveRecord::Migration[7.0]
  def change
    create_table :santa_assignements do |t|
      t.references :group, null: false, foreign_key: true
      t.references :giver, null: false, foreign_key: { to_table: :users}
      t.references :receiver, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
