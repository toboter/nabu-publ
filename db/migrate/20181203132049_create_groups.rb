class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string     :name
      t.references :creator, foreign_key: {to_table: :users}

      t.timestamps
    end
    add_index :groups, :name
  end
end
