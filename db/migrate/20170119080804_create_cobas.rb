class CreateCobas < ActiveRecord::Migration[5.0]
  def change
    create_table :cobas do |t|
      t.string :nama

      t.timestamps
    end
  end
end
