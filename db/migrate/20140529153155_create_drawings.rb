class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.belongs_to :description
      t.binary :picture

      t.timestamps
    end
  end
end
