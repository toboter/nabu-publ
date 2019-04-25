class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string     :type
      t.references :creator, foreign_key: {to_table: :users}
      t.references :user #entfernen
      t.integer    :parent_id
      t.string     :title
      t.string     :working_title
      t.text       :abstract

      t.timestamps
    end
    add_index :projects, :type
  end
end
