class CreateDescriptions < ActiveRecord::Migration
  def change
    create_table :descriptions do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.belongs_to :drawing
      t.string :body

      t.timestamps
    end
  end
end
