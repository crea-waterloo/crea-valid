class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.string :subject
      t.string :predicate
      t.string :object
      t.string :link

      t.timestamps null: false
    end
  end
end
