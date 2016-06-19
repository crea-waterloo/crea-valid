class CreateRelationRatings < ActiveRecord::Migration
  def change
    create_table :relation_ratings do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :relation, index: true, foreign_key: true
      t.integer :value
      t.text :comment

      t.timestamps null: false
    end
  end
end
