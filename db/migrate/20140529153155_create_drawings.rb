class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.belongs_to :description
      t.string :svg_file

      t.timestamps
    end
  end
end
