class CreateSubstrings < ActiveRecord::Migration[6.1]
  def change
    create_table :substrings do |t|
      t.text :inputstr
      t.text :uniqstr
      t.integer :uniqsize

      t.timestamps
    end
  end
end
