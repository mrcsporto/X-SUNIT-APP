class CreateAbductionResults < ActiveRecord::Migration[6.1]
  def change
    create_table :abduction_results do |t|
      t.references :survivor, null: false, foreign_key: true
      t.references :report, null: false, foreign_key: true
      t.integer :place

      t.timestamps
    end
  end
end
