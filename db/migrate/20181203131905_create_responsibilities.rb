class CreateResponsibilities < ActiveRecord::Migration[5.2]
  def change
    create_table :responsibilities do |t|
      t.string     :type
      t.references :project, foreign_key: true
      t.references :responsable, polymorphic: true
      t.references :creator, foreign_key: {to_table: :users}
      t.datetime   :accepted_at

      t.timestamps
    end
    add_index :responsibilities, :type
  end
end
