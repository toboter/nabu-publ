class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.string     :role
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
    add_index :memberships, :role
  end
end
