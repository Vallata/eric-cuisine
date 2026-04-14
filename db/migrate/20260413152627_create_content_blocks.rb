class CreateContentBlocks < ActiveRecord::Migration[7.1]
  def change
    create_table :content_blocks do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
    add_index :content_blocks, :key, unique: true
  end
end
